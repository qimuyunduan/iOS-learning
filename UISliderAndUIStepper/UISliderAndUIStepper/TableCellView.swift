//
//  TableCellView.swift
//  UISliderAndUIStepper
//
//  Created by qimuyunduan on 15/11/25.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class TableCellView :UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    var label : UILabel = UILabel()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        let screenSize = UIScreen.mainScreen().bounds
        
        
        func initLabelAttr(){
            label.frame = CGRectMake(screenSize.width * CGFloat(0.25),screenSize.height * CGFloat(0.5)-50,100,30)
            label.font = UIFont.systemFontOfSize(25)
            label.backgroundColor = UIColor.grayColor()
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.blackColor()
            self.view.addSubview(label)
        
        }
        
        
        if self.title == "UISlider"
        {
            
        initLabelAttr()
         let mySlider = UISlider(frame: CGRectMake(screenSize.width * CGFloat(0.25),screenSize.height * CGFloat(0.5),100,30))
            mySlider.minimumValue = 0
            mySlider.maximumValue = 100
            mySlider.value = 0
            mySlider.userInteractionEnabled = true
            mySlider.addTarget(self, action: "changeLabelText:", forControlEvents: UIControlEvents.ValueChanged)
          
         self.view.addSubview(mySlider)
        
        }
        else if  self.title == "UIStepper" {
        initLabelAttr()
        let myStepper = UIStepper(frame: CGRectMake(screenSize.width * CGFloat(0.25),screenSize.height * CGFloat(0.5),100,30))
            myStepper.maximumValue = 100
            myStepper.minimumValue = 0
            myStepper.value = 0
            myStepper.userInteractionEnabled = true
            myStepper.stepValue = 5
            myStepper.addTarget(self, action: "changeValue:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(myStepper)
            
        
        }
        
        
        
    }
    
    func changeLabelText(sender:AnyObject?){
    
        let slider:UISlider = sender as! UISlider
        self.label.text = String(slider.value)
    
    
    }
    func changeValue(sender:AnyObject?) {
    let stepper = sender as! UIStepper
    self.label.text = String(stepper.value)
    
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 3
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(format:"%i", row)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
