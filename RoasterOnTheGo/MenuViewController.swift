//
//  ViewController.swift
//  RoasterOnTheGo
//
//  Created by Andrew Bancroft on 12/14/15.
//  Copyright © 2015 Andrew Bancroft. All rights reserved.
//
import UIKit

class MenuViewController: UITableViewController {
    
    let products = [
        "Africa" : ["Cameroon", "Congo", "Ethiopia", "Kenya","Rwanda"],
        "Central America" : ["Costa Rica", "El Salvador", "Guatemala", "Honduras", "Mexico"],
        "Indonesia" : ["Java Sunda", "Sumatra"],
        "South America" : ["Brazil", "Colombia"]
    ]
    
    let productSectionHeaders = ["Africa", "Central America", "Indonesia", "South America"]
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return productSectionHeaders.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return productSectionHeaders[section]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionHeaderName(forSection: section);
        return products[key]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell")!
        
        let key = sectionHeaderName(forSection: indexPath.section)
        cell.textLabel?.text = products[key]![indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! OrderViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let key = sectionHeaderName(forSection: selectedIndexPath.section)
        
        destinationVC.productName = products[key]![selectedIndexPath.row]
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    // MARK: Helpers
    func sectionHeaderName(forSection section: Int) -> String {
        return productSectionHeaders[section]
    }
}

