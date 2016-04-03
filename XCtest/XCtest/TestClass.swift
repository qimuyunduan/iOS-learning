//
//  TestClass.swift
//  XCtest
//
//  Created by qimuyunduan on 16/4/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit


struct WishContainer {
    
    var itemCount :Int = 0
    var itemValues = ["cellphone"]
    func getItemCount() -> Int {
        return itemCount
    }
    mutating func setItemCount() -> Void {
        itemCount = itemValues.count
    }
    
}
class TestClass {
    
    var firstWish  :String = ""
    
    var wishContainer :WishContainer?
    
    func getFirstWish() -> String {
        return firstWish
    }
    func getWishCount()-> Int {
        return wishContainer!.getItemCount()
    }
    func setFirstWish(firstWish:String){
        self.firstWish = firstWish
    }
    func addWishes(wish:String){
        self.wishContainer?.itemValues.append(wish)
    }
    
    
}
