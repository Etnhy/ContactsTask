//
//  ViewController.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
     var presenter: MainPresenter?
    
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
        cell.setCount(countString: presenter?.conCount(cat: ContactsCategory.allCases[indexPath.row]) ?? "err")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ContactsCategory.allCases[indexPath.row].title)
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: Bundle(identifier: DetailViewController.reuseId)).instantiateViewController(
            withIdentifier: DetailViewController.reuseId) as! DetailViewController
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension MainViewController: ViewProtocol {
    
}
