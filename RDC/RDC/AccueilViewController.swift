//
//  AccueilViewController.swift
//  RDC
//
//  Created by Alexandre Verhoye on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

class AccueilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        // Do any additional setup after loading the view.
    }
    
    
 func createView(){
        self.title = "Accueil"
        createLogo()
        
    }
    
    func createLogo(){
        //let logo = UIImageView(frame: CGRect(x: 10, y: 30, width: 200, height: 21))
        let label = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 21))
            label.text = "Radio Dijon Campus"
        self.view.addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        guard let url = URL(string: "https://radiodijoncampus.com") else { return }
        UIApplication.shared.open(url)
    }

}
