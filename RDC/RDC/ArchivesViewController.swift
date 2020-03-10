//
//  ArchivesViewController.swift
//  RDC
//
//  Created by Alexandre Verhoye on 10/03/2020.
//  Copyright © 2020 RadioDijonCampus. All rights reserved.
//

import UIKit

class ArchivesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tArchives = [
        Archive(name: "test 1", style: "Rap US", image: UIImage()),
        Archive(name: "test 2", style: "Rap FR", image: UIImage()),
        Archive(name: "test 3", style: "Pop Culture", image: UIImage())
        ] as [Archive];

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView(){
            createArchivesListView()
            createNavBar();
        }
        
        func createNavBar(){
            let screenSize: CGRect = UIScreen.main.bounds
            let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: screenSize.width, height: 44))
            let navItem = UINavigationItem(title: "Archives")
            let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
            navItem.rightBarButtonItem = doneItem
            navBar.setItems([navItem], animated: false)
            self.view.addSubview(navBar)
        }
        
        func createArchivesListView(){
            let archivesList = UITableView();
            
            archivesList.frame = self.view.frame; // A modif pour qu'il ne prenne pas tout l'espace
            archivesList.dataSource = self
            archivesList.delegate = self
            //Indique le template pour la cellule
            archivesList.register(ArchiveCell.self, forCellReuseIdentifier: "cell")
            //Ajoute la table a la vue
            self.view.addSubview(archivesList);
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            tArchives.count;
           //G.tChroniques.count;
        }
         
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //Récupère les données
           
           let archive = tArchives[indexPath.row]
               
               //G.tChroniques[indexPath.row]
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ArchiveCell
           //Assigne les données a la cellule
           cell.archive = archive
           
           return cell
       }
        
        @objc func done() {
            print("back pressed")
        }
    }




    class ArchiveCell: UITableViewCell {

        private var archiveImage:UIImageView = {
            let img = UIImageView()
            img.contentMode = .scaleToFill
            img.clipsToBounds = true
            return img
        }()
        
        private var archiveName:UILabel = {
           let lbl = UILabel()
            lbl.textColor = .blue
            lbl.textAlignment = .left
            return lbl
        }()
     
        private var archiveStyle:UILabel = {
           let lbl = UILabel()
            lbl.textColor = .red
            lbl.textAlignment = .left
            return lbl
        }()
        
        var archive:Archive? {
            didSet {
                archiveImage.image = archive?.image
                archiveName.text = archive?.name
                archiveStyle.text = archive?.style
            }
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            //ajoute les elements a la vue
            contentView.addSubview(archiveImage)
            contentView.addSubview(archiveName)
            contentView.addSubview(archiveStyle)
            
            archiveImage.frame = CGRect(x: 0, y: 0, width: 140, height: 100)
            archiveName.frame = CGRect(x: 150, y: 10, width: 140, height: 80)
            archiveStyle.frame = CGRect(x: 250, y: 10, width: 140, height: 80)

        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
}
