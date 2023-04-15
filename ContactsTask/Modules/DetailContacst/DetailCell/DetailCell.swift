//
//  DetailCell.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 15.04.2023.
//

import UIKit
import ContactsUI

class DetailCell: UITableViewCell {
    static let reuseId = "DetailCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureCell(contact: CNContact) {
        self.nameLabel.text = "Name:" + contact.givenName + "" + contact.familyName

        if let emailString = contact.emailAddresses.first?.value {
            self.emailLabel.text = "Email: \(emailString)"
        }
        
        if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
            self.phoneNumberLabel.text = "Phone: \(phoneNumber)"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }
    
}
