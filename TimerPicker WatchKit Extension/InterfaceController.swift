//
//  InterfaceController.swift
//  TimerPicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 14/02/19.
//  Copyright © 2019 Vinod Ramanathan. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // #MARK: IBOutlet
    @IBOutlet weak var hourPicker: WKInterfacePicker!
    @IBOutlet weak var minPicker: WKInterfacePicker!
    @IBOutlet weak var hourLabel: WKInterfaceLabel!
    @IBOutlet weak var minLabel: WKInterfaceLabel!
    @IBOutlet weak var timerButton: WKInterfaceButton!
    
    // #MARK: Variable - Array
    var HourArray: Array<Any> = []
    var HourLoadArray: Array<Any> = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
    var HourFormatArray: Array<Any> = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
    var MinArray: Array<Any> = []
    var MinLoadArray: Array<Any> = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
    var MinFormatArray: Array<Any> = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
    
    // #MARK: Variable - Strings
    var hh = "00"
    var mm = "00"
    var totalTime = ""
    
    // #MARK: awake - withContext
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        for (id,_) in HourLoadArray.enumerated(){
            let pickerItem = WKPickerItem()
            pickerItem.title = HourLoadArray[id] as? String
            pickerItem.caption = "Hour"
            HourArray.append(pickerItem)
        }
        
     
        for (id,_) in MinLoadArray.enumerated(){
            let pickerItem = WKPickerItem()
            pickerItem.title = MinLoadArray[id] as? String
            pickerItem.caption = "Min"
            MinArray.append(pickerItem)
        }
        
        hourPicker.setItems(HourArray as? [WKPickerItem])
        minPicker.setItems(MinArray as? [WKPickerItem])
        
        hourLabel.setText("00")
        minLabel.setText("00")
        
        totalTime = "00:00"
        
    }
    
    // #MARK:  willActivate
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    // #MARK:  willActivate
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // #MARK: Actions - Picker and Button
    
    @IBAction func hour(_ value: Int) {
       
        minPicker.resignFocus()
        
        hourPicker.focus()
        
        let hour = HourArray[value] as! WKPickerItem
        
        hour.caption = "hour";
        
        hourLabel.setText(HourFormatArray[value] as? String)
        
        hh = HourFormatArray[value] as! String
        
        totalTime =  "\(hh):\(mm)"
        
        timerButton.setTitle(totalTime)
        
    }
    
    
    @IBAction func min(_ value: Int) {
  
        hourPicker.resignFocus()
        
        minPicker.focus()
        
        let min = MinArray[value] as! WKPickerItem
        
        min.caption = "min";
    
        minLabel.setText(MinFormatArray[value] as? String)
        
        mm = MinFormatArray[value] as! String
        
        totalTime = "\(hh):\(mm)"
        
        timerButton.setTitle(totalTime)
        
    }
    
    
    @IBAction func timerAction() {
        print("totaltime ",totalTime)
    }
    
    
}
