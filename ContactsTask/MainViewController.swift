//
//  ViewController.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Contacts"
    }
    
    
    private func setupTableView() {
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.reuseId)
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
        
        return cell
    }
    
    
}


enum ContactsCategory: CaseIterable {
    case all
    case repeats
    case duplicates
    case withoutNames
    case withoutNumbers
    case withoutEmail
    
    
    
    var image: String {
        switch self {
        case .all: return "person.circle"
        case .repeats: return "person.3"
        case .duplicates: return "phone"
        case .withoutNames: return "person.crop.circle.badge.questionmark"
        case .withoutNumbers: return "iphone.gen2.slash"
        case .withoutEmail: return "envelope"
        }
    }
    
    var title: String {
        switch self {
        case .all:return "Контакты"
        case .repeats:return "Повторяющиеся имена"
        case .duplicates:return "Дубликаты номеров"
        case .withoutNames:return "Без имени"
        case .withoutNumbers:return "Нет номера"
        case .withoutEmail:return "Нет электронной почты"
        }
    }
}
