//
//  FoodViewController.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 03.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import  SwiftyJSON

class DetailsViewController: UIViewController {
var currentItemJSON: JSON = JSON.null
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentItemJSON["foodName"].string
        self.itemName.text = currentItemJSON["foodName"].string
        self.itemPrice.text = currentItemJSON["price"].string
        self.itemDesc.text = currentItemJSON["desc"].string
        self.itemImage.image = UIImage(named: currentItemJSON["image"].string!)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
