//
//  GridViewControllerLayout.swift
//  duolie
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation
import UIKit

class GridViewControllerLayout: UICollectionViewLayout {
    
    
    private var itemAttribute:[[UICollectionViewLayoutAttributes]] = []
    private var itemSize:[NSValue] = []
    private var contentSize:CGSize = CGSizeZero
    //表格试图控制器
    var viewController:GridViewController!
    
    override func prepareLayout() {
        
        if collectionView?.numberOfSections() == 0 {
            return
        }
        var column = 0
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        var contentWidth: CGFloat = 0
        var contentHeight: CGFloat = 0
        
        if itemAttribute.count > 0 {
            return
        }
        
        itemAttribute = []
        itemSize = []
        
        if itemSize.count != viewController.cols.count {
            calItemSize()
        }
        
        for var section = 0; section < collectionView?.numberOfSections(); section++ {
            var sectionAttributes: [UICollectionViewLayoutAttributes] = []
            
            for var index = 0; index < viewController.cols.count; index++ {
                
                let itemSizeValue = itemSize[index].CGSizeValue()
                
                let indexPath = NSIndexPath(forItem: index, inSection: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:
                    indexPath)
                //除第一列，其它列位置都左移一个像素，防止左右单元格间显示两条边框线
                if index == 0{
                    attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset,
                        itemSizeValue.width, itemSizeValue.height))
                }else {
                    attributes.frame = CGRectIntegral(CGRectMake(xOffset-1, yOffset,
                        itemSizeValue.width+1, itemSizeValue.height))
                }
                
                sectionAttributes.append(attributes)
                
                xOffset = xOffset+itemSizeValue.width
                column++
                
                if column == viewController.cols.count {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }
                    
                    column = 0
                    xOffset = 0
                    yOffset += itemSizeValue.height
                }
            }
            itemAttribute.append(sectionAttributes)
        }
        
        let attributes = itemAttribute.last!.last! as UICollectionViewLayoutAttributes
        contentHeight = attributes.frame.origin.y + attributes.frame.size.height
        contentSize = CGSizeMake(contentWidth, contentHeight)
        
    }
    
    
    
    //需要更新layout时调用
    override func invalidateLayout() {
        itemAttribute = []
        itemSize      = []
        contentSize   = CGSizeZero
        super.invalidateLayout()
    }
    //返回内容区域总大小
    override func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    //返回指定单元格的位置和大小
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttribute[indexPath.section][indexPath.row]
    }
    /**
     返回所有单元格属性
     
     - parameter rect: <#rect description#>
     
     - returns: 所有单元格属性数组
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributes : [UICollectionViewLayoutAttributes] = []
        
        for section in itemAttribute {
        
            attributes.appendContentsOf(section.filter(
            
                {  (includeElement:UICollectionViewLayoutAttributes) -> Bool in
                    
                    return CGRectIntersectsRect(rect, includeElement.frame)
                }))
        
        }
        
        return attributes
    }
    //边界改变时是否应该刷新布局
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        let oldBounds = self.collectionView?.bounds
        if CGRectGetWidth(oldBounds!) != CGRectGetWidth(newBounds) {
            return true
        
        }
        else {
            return false
        }
    }
    //计算单元格尺寸
    
    func calItemSize() {
        
        var remainingWidth = collectionView!.frame.width-(collectionView?.contentInset.left)!-(collectionView?.contentInset.right)!
        for var index = viewController.cols.count-1;index>=0;index-- {
        
            let newItemSize = sizeForItemWithIndex(index,remainingWidth:remainingWidth)
            
            remainingWidth -= newItemSize.width
            
            let newItemSizeValue = NSValue(CGSize:newItemSize)
            
            itemSize.insert(newItemSizeValue, atIndex: 0)
        
        }
    
    }
    //计算某一列的宽度
    func sizeForItemWithIndex(columnIndex:Int,remainingWidth:CGFloat) ->CGSize {
    
        let columnString = viewController.cols[columnIndex]
        
        //根据列头标题字体计算宽度
        let size = NSString(string: columnString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(15),NSUnderlineStyleAttributeName:NSUnderlineStyle.StyleSingle.rawValue])
        //如果有剩余空间则给第一列
        if columnIndex == 0 {
        
            return CGSizeMake(max(remainingWidth, size.height+10),size.height+10)
        
        }
    
            return CGSizeMake(size.width+18, size.height+10)
    }
    
}
