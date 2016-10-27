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
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return productSectionHeaders.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return productSectionHeaders[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionHeaderName(forSection: section);
        return products[key]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")!
        
        let key = sectionHeaderName(forSection: (indexPath as NSIndexPath).section)
        cell.textLabel?.text = products[key]![(indexPath as NSIndexPath).row]
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! OrderViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let key = sectionHeaderName(forSection: (selectedIndexPath as NSIndexPath).section)
        
        destinationVC.productName = products[key]![(selectedIndexPath as NSIndexPath).row]
    }
    
    @IBAction func unwindToMenu(_ segue: UIStoryboardSegue) {}
    
    // MARK: Helpers
    func sectionHeaderName(forSection section: Int) -> String {
        return productSectionHeaders[section]
    }
}

