//
//  OrderViewController.swift
//  SwiftUnwindSegueExample
//
//  Created by Andrew Bancroft on 12/14/15.
//  Copyright © 2015 Andrew Bancroft. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    var productName: String!
    
    @IBOutlet weak var productNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productNameLabel.text = productName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func orderButtonTapped(sender: UIButton) {
        
    }
}