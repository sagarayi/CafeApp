//
//  ViewController.swift
//  SwiftSample
//
//  Created by sagar ayi on 03/05/17.
//  Copyright © 2017 SomeName. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var mainTable: UITableView!
    let names = ["Pizza","SevPuri","Vada Pav","Dahi Puri"]
    let image_names = ["greek","sev_puri","vada_pav","dahi_puri"]
    let price_list = ["Rs.200","Rs.30","Rs.10","Rs.35"]
    var selectedIndex : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.delegate = self
        mainTable.dataSource = self
        
        self.title = "BroadCafe"
        self.navigationController?.navigationBar.barTintColor  = UIColor(red:0.78, green:0.44, blue:0.24, alpha:1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readFromFile() -> String {
        let filePath = Bundle.main.path(forResource: "sample", ofType: "txt")
        var contentsOfFile : String!
        do
        {
                contentsOfFile = try String(contentsOfFile:filePath!)
        }
        catch let error as NSError
        {
            print("error is \(error)")
        }
        
        return contentsOfFile!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"SampleCell", for: indexPath)
        
        cell.backgroundView = UIImageView.init(image: UIImage.init(named: image_names[indexPath.row]))
        let cellImage :UIImageView = (cell.viewWithTag(100) as? UIImageView)!
        
        cellImage.image = UIImage.init(named: image_names[indexPath.row])
        let cellLabel :UILabel = cell.viewWithTag(101) as! UILabel
        cellLabel.text = names[indexPath.row]
        
        let cellPriceLabel:UILabel = cell.viewWithTag(102) as! UILabel
        cellPriceLabel.text = price_list[indexPath.row]

        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "detailedSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailedSegue"
        {
             let destinationVC = segue.destination as! AnotherViewController
            
                destinationVC.itemName = names[selectedIndex!]
                destinationVC.imageName = image_names[selectedIndex!]
                destinationVC.desc  = readFromFile()//should change later
            
        }
    }

}

