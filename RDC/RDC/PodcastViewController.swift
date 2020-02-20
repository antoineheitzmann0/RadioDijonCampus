//
//  PodcastViewController.swift
//  RDC
//
//  Created by Alexandre Verhoye on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tPodcasts = [
        Chronique(name: "podcast 1", style: "lourd", image: UIImage()),
        Chronique(name: "podcast 2", style: "grave bien",image: UIImage()),
        Chronique(name: "podcast 3", style: "sympa", image: UIImage())
    ] as [Chronique];
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    

    func createView(){
        createPodcastsListView()
        createNavBar();
    }
    
    func createNavBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Podcast")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func createPodcastsListView(){
        let podcastsList = UITableView();
        
        podcastsList.frame = self.view.frame; // A modif pour qu'il ne prenne pas tout l'espace
        podcastsList.dataSource = self;
        podcastsList.delegate = self;
        //Indique le template pour la cellule
        podcastsList.register(PodcastCell.self, forCellReuseIdentifier: "cell")
        //podcastsList.register(ArtistCell_2.self, forCellReuseIdentifier: "cell2")
        //Ajoute la table a la vue
        self.view.addSubview(podcastsList);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tPodcasts.count;
       //G.tChroniques.count;
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //Récupère les données
       
       let podcast = tPodcasts[indexPath.row]
           
           //G.tChroniques[indexPath.row]
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! PodcastCell
       //Assigne les données a la cellule
       cell.podcast = podcast
       
       return cell
   }
    
    @objc func done() {
        print("back pressed")
    }
}




class PodcastCell: UITableViewCell {

    private var podcastImage:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    private var podcastName:UILabel = {
       let lbl = UILabel()
        lbl.textColor = .blue
        lbl.textAlignment = .left
        return lbl
    }()
 
    private var podcastStyle:UILabel = {
       let lbl = UILabel()
        lbl.textColor = .red
        lbl.textAlignment = .left
        return lbl
    }()
    
    var podcast:Chronique? {
        didSet {
            podcastImage.image = podcast?.image
            podcastName.text = podcast?.name
            podcastStyle.text = podcast?.style
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //ajoute les elements a la vue
        contentView.addSubview(podcastImage)
        contentView.addSubview(podcastName)
        contentView.addSubview(podcastStyle)
        
        podcastImage.frame = CGRect(x: 0, y: 0, width: 140, height: 100)
        podcastName.frame = CGRect(x: 150, y: 10, width: 140, height: 80)
        podcastStyle.frame = CGRect(x: 250, y: 10, width: 140, height: 80)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
