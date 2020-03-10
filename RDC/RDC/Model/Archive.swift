//
//  Archive.swift
//  RDC
//
//  Created by Antoine Heitzmann on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

public class Archive: NSObject {
    
        public var name: String;
        public var style: String;
        public var image: UIImage;
       
       public init(name: String, style: String, image: UIImage) {
           self.name = name;
           self.image = image;
           self.style = style;
       }
    

}
