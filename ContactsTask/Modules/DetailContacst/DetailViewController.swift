//
//  DetailViewController.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 15.04.2023.
//

import UIKit
import ContactsUI

class DetailViewController: UIViewController {
    static let reuseId = "DetailViewController"
    
    @IBOutlet weak var detailTableView: UITableView!
    
    private var contacts: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    private func setupTableView() {
        
        detailTableView.register(UINib(nibName: DetailCell.reuseId, bundle: nil), forCellReuseIdentifier: DetailCell.reuseId)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseId, for: indexPath) as? DetailCell else {
            return UITableViewCell()
        }
        cell.configureCell(contact: contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
extension DetailViewController: ContactsToDetail {
    func setDetailContacts(cnContacts: [CNContact]) {
        self.contacts = cnContacts
    }
    
    
}
