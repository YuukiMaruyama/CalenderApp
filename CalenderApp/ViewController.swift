//
//  ViewController.swift
//  CalenderApp
//
//  Created by まるやまゆうき on 2019/05/30.
//  Copyright © 2019 yuuki.maruyama. All rights reserved.
//

import UIKit
import ESTabBarController
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBAction func mailAddressTextField(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // currentUserがnillならログインしてない
        if Auth.auth().currentUser == nil {
            // ログインしてない時の処理
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(loginViewController!, animated: true, completion: nil)
        }
    }
    
    func setupTab() {
        
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["home", "camera", "setting"])
        
        // 背景色、選択時の色を設定する
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        tabBarController.selectionIndicatorHeight = 3
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChild(tabBarController)
        let tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            ])
        tabBarController.didMove(toParent: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let artistViewController = storyboard?.instantiateViewController(withIdentifier: "ArtistSearch")
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "LiveSearch")
        
        tabBarController.setView(artistViewController, at: 0)
        tabBarController.setView(homeViewController, at: 1)
        tabBarController.setView(settingViewController, at: 2)
        
        // 0610 TODO
        // この機能はいらないのでは？
//        // 真ん中のタブはボタンとして扱う
//        tabBarController.highlightButton(at: 1)
//        tabBarController.setAction({
//            // ボタンが押されたらImageViewControllerをモーダルで表示する
//            let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//            self.present(imageViewController!, animated: true, completion: nil)
//        }, at: 1)
    }
}

