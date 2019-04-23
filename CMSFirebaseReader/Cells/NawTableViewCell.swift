//
//  NawTableViewCell.swift
//  CMSFirebaseReader
//
//  Created by Richard Simpson on 23/04/2019.
//  Copyright © 2019 Richard Simpson. All rights reserved.
//

import UIKit

class NawTableViewCell: UITableViewCell {
    
    @IBOutlet var naam: UILabel!
    @IBOutlet var adres: UILabel!
    @IBOutlet var postcode: UILabel!
    @IBOutlet var woonplaats: UILabel!
    @IBOutlet var telefoonnummer: UILabel!
    @IBOutlet var pasfoto: UIImageView!
    
    func setData(naw:NawGegevens) {
        self.naam.text = naw.naam
        self.adres.text = naw.adres
        self.postcode.text = naw.postcode
        self.woonplaats.text = naw.woonplaats
        self.telefoonnummer.text = naw.telefoonnummer
        
        let pasfotoUrl = URL(string: naw.pasfoto)
        self.pasfoto.load(url:pasfotoUrl!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
