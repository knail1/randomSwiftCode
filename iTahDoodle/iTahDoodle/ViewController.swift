//
//  ViewController.swift
//  iTahDoodle
//
//  Created by knail1 on 5/6/17.
//  Copyright © 2017 knail1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Add to-do item: \(itemTextField.text)")
    }
    
    @IBAction func airPlaneModeOnButtonPressed(_ sender: UIButton) {
          //  print("Add to-do item: \(itemTextField.text)")
            
    }

}

