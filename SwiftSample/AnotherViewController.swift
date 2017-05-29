//
//  AnotherViewController.swift
//  SwiftSample
//
//  Created by sagar ayi on 03/05/17.
//  Copyright © 2017 SomeName. All rights reserved.
//

import Foundation
import UIKit

class AnotherViewController:UIViewController
{
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDesc: UITextView!
   
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    var itemName : String?
    var desc: String?
    var imageName : String?
    var itemPrice : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemPrice = 10
        self.title = itemName
        self.view.backgroundColor = UIColor(red:0.98, green:0.95, blue:0.92, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor  = UIColor(red:0.78, green:0.44, blue:0.24, alpha:1.0)
        self.itemDesc.setContentOffset(CGPoint.zero, animated: false)
        itemImage.image = UIImage.init(named: imageName!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func incrementQuantity(_ sender: Any)
    {
        var currentQuantity : Int
            currentQuantity = Int( self.quantityLabel.text!)!
        
        currentQuantity += 1
        self.updateQuantityLabel(newQuantity: currentQuantity)
        self.updateTotalPriceLabel(quantity: currentQuantity)
        
    }
    @IBAction func decreaseQuantity(_ sender: Any)
    {
        var currentQuantity :Int
        
        currentQuantity = Int(self.quantityLabel.text!)!
        
        if(currentQuantity > 0 )
        {
            currentQuantity -= 1
        }
        else
        {
            currentQuantity = 0
        }
        self.updateQuantityLabel(newQuantity: currentQuantity)
        self.updateTotalPriceLabel(quantity: currentQuantity)
        
        
    }
    
    //Helper methods
    
    func updateQuantityLabel( newQuantity:Int)
    {
        self.quantityLabel.text = String(newQuantity)
    }
    func updateTotalPriceLabel(quantity:Int)
    {
        self.totalLabel.text = String(quantity * self.itemPrice)
    }
}
