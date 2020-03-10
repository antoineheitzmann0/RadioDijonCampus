//
//  Chronique.swift
//  RDC
//
//  Created by Antoine Heitzmann on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

public class Podcast: NSObject {
    
    public var name: String;
    public var desc: String;
    public var image: UIImage;
    
    func toString() -> String {
        return "" + String(self.name) + ", " + String(self.desc)
    }

}
