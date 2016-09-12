//
//  ItemListViewController.swift
//  Todo
//
//  Created by Shawn on 11/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: ItemListDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
