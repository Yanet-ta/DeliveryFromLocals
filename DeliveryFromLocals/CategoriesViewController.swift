//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 03.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoriesTableView: UITableView!

    var categoriesJson: JSON = JSON.null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        if let file = Bundle.main.path(forResource: "document", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let json = JSON(data: data)
                if json["categories"].type == .array {
                    self.categoriesJson = json["categories"]
                } else {
                    self.categoriesJson = JSON.null
                }
            } catch {
                self.categoriesJson = JSON.null
            }
        } else {
            self.categoriesJson = JSON.null
        }
        categoriesTableView.tableFooterView = UIView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "General" {
            if let vc = segue.destination as? ItemsViewController {
                if let category = sender as? JSON {
                    vc.currentCategoryJSON = category
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoriesJson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        let categoryObject = self.categoriesJson[indexPath.row]
        if categoryObject.type == .dictionary {
            cell.titleLabel.text = categoryObject["categoryName"].string
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryObject = self.categoriesJson[indexPath.row]
        if categoryObject.type == .dictionary {
            performSegue (withIdentifier: "General", sender: categoryObject)
        }
    }
    
}


