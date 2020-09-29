//
//  ViewController.swift
//  demo
//
//  Created by Phil on 2020/9/25.
//  Copyright © 2020 Phil. All rights reserved.
//

import UIKit
import IRSingleButtonGroup_swift

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "SingleButtonTableViewCell", bundle: nil), forCellReuseIdentifier: SingleButtonTableViewCell.identifier())
    }

// MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: SingleButtonTableViewCell.identifier(), for: indexPath) as! SingleButtonTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Single Button Selection Demo"
            cell.setDefaultIndex(defaultIndex: 0)
            cell.canMultiSelected = false
            cell.disableDeselection = true
        case 1:
            cell.titleLabel.text = "Single Button Selection Demo: Deselect able"
            cell.canMultiSelected = false
        case 2:
            cell.titleLabel.text = "Multi Buttons Selection Demo"
            cell.canMultiSelected = true
        default: break
        }
        
        return cell
    }
}

