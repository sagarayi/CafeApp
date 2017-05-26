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
    var itemName : String?
    var desc: String?
    var imageName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = itemName
        itemImage.image = UIImage.init(named: imageName!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
