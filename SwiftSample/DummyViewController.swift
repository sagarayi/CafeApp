//
//  DummyViewController.swift
//  SwiftSample
//
//  Created by sagar ayi on 04/05/17.
//  Copyright © 2017 SomeName. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {


    var pickerThing:UIPickerView!
    let state_name = ["Stat1","two","three"]
    var stateSelected:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerFrame:CGRect! = CGRect.init(x: 25, y: 52, width: 200, height: 100)
        pickerThing = UIPickerView.init(frame: pickerFrame)
        
        pickerThing.delegate = self
        pickerThing.dataSource = self
        
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickerButton(_ sender: Any) {
        
        let alertAction:UIAlertController! = UIAlertController.init(title: "States", message: "\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton:UIAlertAction! = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alertAction.addAction(okButton)
        
        alertAction.view.addSubview(pickerThing)
        show(alertAction, sender: self)
    }

    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return state_name.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return state_name[row]
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        stateSelected = state_name[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
