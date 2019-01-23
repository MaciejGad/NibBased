//
//  ViewController.swift
//  NibBasedDemo
//
//  Created by Maciej Gad on 23/01/2019.
//  Copyright © 2019 MaciejGad. All rights reserved.
//

import UIKit
import NibBased

class ViewController: NibBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customView: CustomViewContainerInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try TableViewCell.registerNib(in: tableView)
        } catch {
            print("Can't register nib")
        }
        customView.customView?.textLabel.text = "Custom View loaded from nib and updated from code"
    }
    
    override var statusBarLightContent:Bool {
        return false
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier(), for: indexPath) as? TableViewCell  else {
            return UITableViewCell()
        }
        cell.indexPathLabel.text = "\(indexPath.row)"
        return cell
    }
    
    
}
