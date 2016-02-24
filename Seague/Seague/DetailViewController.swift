//
//  DetailViewController.swift
//  Seague
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {

    var itemValue : String?
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.text = itemValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
