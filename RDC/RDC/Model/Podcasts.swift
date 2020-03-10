//
//  Podcasts.swift
//  RDC
//
//  Created by Antoine Heitzmann on 10/03/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

public class Podcasts: NSObject {
        public var name: String;
        public var desc: String;
        public var image: UIImage?;
        
        public init(name: String, desc: String, image: UIImage?) {
            self.name = name;
            self.image = image;
            self.desc = desc;
        }
        func toString() -> String {
            return "" + String(self.name) + ", " + String(self.desc)
        }

    }
