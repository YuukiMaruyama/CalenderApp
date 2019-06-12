//
//  HomeViewController.swift
//  CalenderApp
//
//  Created by まるやまゆうき on 2019/06/10.
//  Copyright © 2019 yuuki.maruyama. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController {

    @IBOutlet weak var debugLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let name = Auth.auth().currentUser?.displayName
        debugLabel.text = "DEBUG:" + String(name!)
        
//        let grade = Auth.auth().currentUser?.grade
//        debugLabel.text = "DEBUG:" + String(grade!)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}
