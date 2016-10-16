//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 03.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import  SwiftyJSON

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var itemsTableView: UITableView!
    
    var itemsJSON: JSON = JSON.null
    var currentCategoryJSON: JSON = JSON.null
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentCategoryJSON["categoryName"].string
        if currentCategoryJSON["items"].type == .array {
            self.itemsJSON = currentCategoryJSON["items"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemsToDetailsShowSegue" {
            if let vc = segue.destination as? DetailsViewController {
                if let item = sender as? JSON {
                    vc.currentItemJSON = item
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let itemObject = self.itemsJSON[indexPath.row]
        if itemObject.type == .dictionary {
            cell.titleLabel.text = itemObject["foodName"].string
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemObject = self.itemsJSON[indexPath.row]
        if itemObject.type == .dictionary {
            performSegue (withIdentifier: "ItemsToDetailsShowSegue", sender: itemObject)
        }
    }

}
