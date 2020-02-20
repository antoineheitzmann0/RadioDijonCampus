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
            let json = JSON(response.value!)
            for (key, subJson) in json {
                var show = Show()
                //print(subJson)
                if let name = subJson["slug"].string {
                    print(name)
                    show.name = name
                }
                if let id = subJson["id"].int{
                    print(id)
                    show.id = id
                }
                G.tShows.append(show)
            }
            print(G.tShows)
        }
    }
}
