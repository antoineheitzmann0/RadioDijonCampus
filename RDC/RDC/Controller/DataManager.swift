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
        AF.request(G.path_Archives).responseJSON{
            response in
            let json = JSON(response.value!)
            print(json)
        }
    }
    
    func getChronique(){
    }
    
    func getRedac(){
    }
    
    func getShows(){
    }
}
