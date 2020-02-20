//
//  ViewController.swift
//  RadioCampus
//
//  Created by Alexandre Verhoye on 31/01/2020.
//  Copyright © 2020 IQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {
    
    let ctrlTabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createTabBar()
        let _ = DataManager()
    }
    
    func createTabBar(){
        let VC1 = UIViewController()
        let VC2 = UIViewController()
        let VC3 = UIViewController()
        let VC4 = UIViewController()


        VC1.title = "Accueil"
        VC1.view.backgroundColor = .red
        VC1.tabBarItem = UITabBarItem(title: "Accueil", image: UIImage(named : "accueil"), selectedImage: UIImage(named : "accueil"))
        
        VC2.title = "Podcasts"
        VC2.view.backgroundColor = .blue
        VC2.tabBarItem = UITabBarItem(title: "Podcasts", image: UIImage(named : "podcast"), selectedImage: UIImage(named : "podcast"))
        
        VC3.title = "Archives"
        VC3.view.backgroundColor = .yellow
        VC3.tabBarItem = UITabBarItem(title: "Archives", image: UIImage(named : "archive"), selectedImage: UIImage(named : "archive"))
        
        VC4.title = "Playlist"
        VC4.view.backgroundColor = .green
        VC4.tabBarItem = UITabBarItem(title: "Playlist", image: UIImage(named : "playlist"), selectedImage: UIImage(named : "playlist"))
        
        ctrlTabBar.setViewControllers([VC1, VC2, VC3, VC4], animated: true)
        ctrlTabBar.selectedIndex = 0
        ctrlTabBar.delegate = self
        
        self.view.addSubview(ctrlTabBar.view)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Titre", tabBarController.title, tabBarController.selectedIndex)
    }
    


}

