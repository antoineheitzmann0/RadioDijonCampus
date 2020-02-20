//
//  G.swift
//  RDC
//
//  Created by Antoine Heitzmann on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

public class G: NSObject {
    public static var wSC:CGFloat = 0.0
    public static var hSC:CGFloat = 0.0
    
    public static var path_REST:String = "http://radiodijoncampus.com/wp-json/wp/v2/"
    public static var path_Archives:String = "https://archives.radiodijoncampus.com/wp-json/wp/v2/"
    public static var path_Sounds:String = "http://193.52.238.101:8081"
    public static var path_Live:String = "http://frequence.u-bourgogne.fr:8082/dijoncampus"
    public static var path_Podcast:String = "http://frequence.u-bourgogne.fr:8081/testdata.php"
    
    // Tableaux pour stocker les diffÃ©rentes donnÃ©es (Ã©missions, rÃ©dactionelles, chroniques, archives)
    public static var tShows:[Show] = []
    public static var tRedac:[Redac] = []
    public static var tChroniques:[Chronique] = []
    public static var tArchives:[Archive] = []
}
