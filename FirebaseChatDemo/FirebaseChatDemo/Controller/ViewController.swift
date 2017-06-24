//
//  ViewController.swift
//  FirebaseChatDemo
//
//  Created by sagar.thummar on 23/06/17.
//  Copyright © 2017 Solution Analysts Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }

    @objc func logoutButtonTapped() {
        self.present(LoginViewController(), animated: true, completion: nil)
    }
}

