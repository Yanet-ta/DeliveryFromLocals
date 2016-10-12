//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 03.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "General" {
            if let vc = segue.destination as? ItemsViewController {
                if let title = sender as?  String {
                    vc.title = title
                }
            }
        }
    }
    
    @IBAction func  categoryButtonPressed(_ sender: UIButton) {
        performSegue (withIdentifier: "General", sender: sender.titleLabel?.text)
    }

}

