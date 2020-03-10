import UIKit;
import SwiftyJSON;
import Alamofire;

public class DataManager {
    init(){
        getArchives()
        getRedac()
        getChronique()
        getShows()
    }
    
    func getArchives(){
    }
    
    func getChronique(){
        
    }
    
    func getRedac(){
    }
    
    func getShows(){
        AF.request(G.path_REST + "pages?parents=393").responseJSON{
            response in
            let json = JSON(response.value)
            for (key, subJson) in json {
                
                let title = subJson["title"]["rendered"].stringValue
                var showId = 0
                let desc = subJson["content"]["rendered"].stringValue
                
                let content = subJson["content"]["rendered"].stringValue
                if let id = subJson["id"].int{
                    showId = id
                }
                
                var podcast = Podcasts(name : title, desc : desc, image : nil)
                G.tPodcast.append(podcast)
            }
        }
    }
}

//393 emission
//chronique 313
//redac 473
