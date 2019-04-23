//
//  ViewController.swift
//  CMSFirebaseReader
//
//  Created by Richard Simpson on 23/04/2019.
//  Copyright © 2019 Richard Simpson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var nawArray : [NawGegevens] = [NawGegevens]()
    var db: Firestore!
    
    @IBOutlet var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        _registerCells()
        _loadFirebaseData()
    }
    private func _registerCells() {
        tableView.tableFooterView = UIView()
        let nawNib = UINib(nibName: "NawTableViewCell", bundle: nil)
        tableView.register(nawNib, forCellReuseIdentifier: "NawTableViewCell")
    }
    
    
    fileprivate func _loadFirebaseData() {
        // FirebaseLoketInstaller.configureFirebase()
        let settings = FirestoreSettings()
        // Zet caching aan.
        settings.isPersistenceEnabled = true
        Firestore.firestore().settings = settings
        
        db = Firestore.firestore()
        
        db.collection("nawgegevens").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
             
                if let snapShot = querySnapshot {
                    
                    for document in snapShot.documents {
                        let naam = document.data()["naam"] as! String
                        let adres = document.data()["adres"] as! String
                        let postcode = document.data()["postcode"] as! String
                        let woonplaats = document.data()["woonplaats"] as! String
                        let telefoonnummer = document.data()["telefoonnummer"] as! String
                        let pasfoto = document.data()["pasfoto"] as! String
                        
                        self.nawArray.append(NawGegevens(naam: naam, adres: adres, postcode: postcode, woonplaats: woonplaats, telefoonnummer: telefoonnummer, pasfoto: pasfoto))
                    }
                    
                    self.tableView.reloadData()
                }
              
            }
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        nawArray.removeAll()
        _loadFirebaseData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nawArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "NawTableViewCell") as! NawTableViewCell
        cell.setData(naw:nawArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

struct NawGegevens {
    let naam,adres,postcode,woonplaats,telefoonnummer,pasfoto :String
}
