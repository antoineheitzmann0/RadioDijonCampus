//
//  PodcastViewController.swift
//  RDC
//
//  Created by Alexandre Verhoye on 20/02/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tPodcasts:[Podcasts] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()

        tPodcasts = G.tPodcast
        
    }
    
    let screenSize: CGRect = UIScreen.main.bounds

    func createView(){
        createPodcastsListView()
        createNavBar();
        print(tPodcasts)
    }
    
    func createNavBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: screenSize.width, height: 0))
        let navItem = UINavigationItem(title: "Podcast")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func createPodcastsListView(){
        let podcastsList = UITableView();
        
        podcastsList.frame = CGRect(x: 0, y: 80, width: screenSize.width, height: screenSize.height-80);
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
    
    var podcast:Podcasts? {
        didSet {
            podcastImage.image = podcast?.image
            podcastName.text = podcast?.name
            podcastStyle.text = podcast?.description
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //ajoute les elements a la vue
        contentView.addSubview(podcastImage)
        contentView.addSubview(podcastName)
        contentView.addSubview(podcastStyle)
        
        podcastImage.frame = CGRect(x: 20, y: 0, width: 100, height: 100)
        podcastName.frame = CGRect(x: 150, y: 0, width: 150, height: 80)
        podcastStyle.frame = CGRect(x: 150, y: 30, width: 100, height: 80)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
