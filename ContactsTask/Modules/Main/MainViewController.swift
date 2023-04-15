//
//  ViewController.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import UIKit
import Contacts

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
     var presenter: MainPresenter?
    weak var delegate: ContactsToDetail?
    private let cont = CNContactStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Contacts"
        setupTableView()
        self.presenter = MainPresenter(view: self)
        
    }
    
    
    private func setupTableView() {
        
        tableView.register(UINib(nibName: "MainViewCell", bundle: nil), forCellReuseIdentifier: MainViewCell.reuseId)
    }


}

    // MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.reuseId, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(data: ContactsCategory.allCases[indexPath.row])

        DispatchQueue.main.async {
            cell.setCount(
                contacts: self.presenter?.conCount(
                    cat: ContactsCategory.allCases[indexPath.row]) ?? [])

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDetail = presenter?.conCount(cat:ContactsCategory.allCases[indexPath.row])
        
        if let vc = UIStoryboard(name: "DetailViewController", bundle: Bundle(identifier: DetailViewController.reuseId)).instantiateViewController(identifier: DetailViewController.reuseId) as? DetailViewController {
            self.delegate = vc
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.delegate?.setDetailContacts(cnContacts: toDetail!)

    }
    
}

extension MainViewController: ViewProtocol {
    
}

protocol ContactsToDetail: AnyObject {
    func setDetailContacts(cnContacts: [CNContact])
}
