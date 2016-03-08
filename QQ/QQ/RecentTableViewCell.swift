//
//  MyTableViewCell.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/6.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

@IBDesignable   class RecentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var person: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBInspectable var cornerRadius :CGFloat = 25
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置cell是有圆角边框显示
        person.layer.cornerRadius = cornerRadius
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
