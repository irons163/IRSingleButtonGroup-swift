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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleButtonTableViewCell.identifier, for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Single Button Selection Demo
            cell.setD
            cell.canMultiSelected = NO
            cell.disableDeselection = YES
        case 1:
            cell.titleLabel.text = @"Single Button Selection Demo: Deselect able";
            cell.canMultiSelected = NO;
        case:
            cell.titleLabel.text = @"Multi Buttons Selection Demo";
            cell.canMultiSelected = YES;
        }
    }
}

