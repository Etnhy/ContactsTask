//
//  MainViewCell.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import UIKit
import ContactsUI

class MainViewCell: UITableViewCell {
    static let reuseId = "MainViewCell"

    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var contacts: [CNContact] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    func configureCell(data: ContactsCategory) {
        self.mainImage.image = UIImage(systemName: data.image)
        self.title.text = data.title
        
    }
    
    func setCount(contacts: [CNContact]) {
        self.countLabel.text = "\(contacts.count)"
        self.contacts = contacts
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
