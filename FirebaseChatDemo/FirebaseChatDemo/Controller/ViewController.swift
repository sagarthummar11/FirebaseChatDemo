//
//  ViewController.swift
//  FirebaseChatDemo
//
//  Created by sagar.thummar on 23/06/17.
//  Copyright © 2017 Solution Analysts Pvt. Ltd. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))

        //User is not logged in
        if FIRAuth.auth()?.currentUser?.uid == nil {
            performSelector(onMainThread: #selector(handleLogout), with: nil, waitUntilDone: false)
        }
    }

    @objc func handleLogout() {

        do {
            try FIRAuth.auth()?.signOut()
            self.present(LoginViewController(), animated: true, completion: nil)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

