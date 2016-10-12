//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 03.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func  itemButtonPressed(_ sender: UIButton) {
        performSegue (withIdentifier: "ItemsToDetailsShowSegue", sender: sender.titleLabel?.text)
    }

}
