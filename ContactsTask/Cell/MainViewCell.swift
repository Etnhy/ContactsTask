//
//  MainViewCell.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import UIKit

class MainViewCell: UITableViewCell {
    static let reuseId = "MainViewCell"

    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data: ContactsCategory) {
        self.mainImage.image = UIImage(systemName: data.image)
        self.title.text = data.title
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
