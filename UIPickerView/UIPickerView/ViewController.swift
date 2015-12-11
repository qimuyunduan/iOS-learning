//
//  ViewController.swift
//  UIPickerView
//
//  Created by qimuyunduan on 15/12/11.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pickView :UIPickerView = UIPickerView()
    
    let cities = ["北京","上海","重庆","四川","浙江","江苏","贵州","云南","福建","河北","安徽","天津","内蒙","辽宁","黑龙江","广西","广东","甘肃","河南","江西","新疆","宁夏","青海","西藏","湖南","湖北","台湾","香港","澳门","陕西","山西","山东"]
    let sex = ["男","女"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickView.delegate = self
        pickView.dataSource = self
        pickView.selectRow(0, inComponent: 0, animated: true)//设置默认值
        pickView.selectRow(0, inComponent: 1, animated: true)
        pickView.center = self.view.center
        pickView.alpha = 0.0
        self.view.addSubview(pickView)
        let button  = UIButton(type: .System)
        button.frame = CGRectMake(100, 0, 100, 30)
        button.setTitle("选择", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.titleLabel?.textAlignment = NSTextAlignment.Center
        button.titleLabel?.textColor = UIColor.blueColor()
        button.showsTouchWhenHighlighted = true
        button.layer.borderColor = UIColor.brownColor().CGColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.addTarget(self, action: "showPickView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showPickView() {
        
//        UIView.animateWithDuration(2, animations: ()->Void)
        self.pickView.alpha = 1.0
        
        
        
        
    }

}

extension ViewController:UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
         return cities[row]
        
        }
        else{
        
        return sex[row]
        
        }
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            print(cities[row])
            
        }
        else{
            
            print(sex[row])
            
        }

    }





}
extension ViewController:UIPickerViewDataSource {

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
          return cities.count
        }
        else {
        
        return sex.count
        }
        
    }



}