//
//  MainViewPresenter.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import Foundation
import ContactsUI
import Contacts

protocol ViewProtocol: AnyObject {
}

protocol MainPresenterProtocol: AnyObject {
    init(view: ViewProtocol)
        func fetchContacts()
}


class MainPresenter: MainPresenterProtocol {

    weak var view: ViewProtocol?
    
    
    private var phoneContacts = PhoneContacts()
    
    var phoneContactArray = [PhoneContact]() // array of PhoneContact(It is model find it below)
    var filter: ContactsCategory = .duplicates

    
   private let cncontacts = PhoneContacts.shared.getContacts()
    
    required init(view: ViewProtocol) {
        self.view = view
    }
    
    private func fetchAllContacts() -> String {
        let countContacts = cncontacts.count
        return "\(countContacts)"
    }
    
    private func fethWithoutNameContacts() -> String {
        var withoutNames: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.givenName.isEmpty {
                withoutNames.append(cncontact)
            }
        }
        return "\(withoutNames.count)"
    }
    
    private func fetchWithoutEmail() -> String {
        var withoutEmail: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.emailAddresses.isEmpty {
                withoutEmail.append(cncontact)
            }
        }
        return "\(withoutEmail.count)"

    }
    
    private func fetchWithoutNumber() -> String {
        var withoutNumber: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.phoneNumbers.isEmpty {
                withoutNumber.append(cncontact)
            }
        }
        return "\(withoutNumber.count)"
    }

    private func fetchDuplicateNumbers() -> String {
        let singlePhones = Set(Dictionary(grouping: cncontacts, by: {$0.phoneNumbers}).filter{$0.1.count == 1}.map{$0.0})
        let contacts2 = cncontacts.filter {!singlePhones.contains($0.phoneNumbers)}

        return "\(contacts2.count)"
    }
    
    private func fetchDuplicateNames() -> String {
        let singlePhones = Set(Dictionary(grouping: cncontacts, by: {$0.givenName}).filter{$0.1.count == 1}.map{$0.0})
        
        let contacts2 = cncontacts.filter {!singlePhones.contains($0.givenName)}
        return "\(contacts2.count)"
    }

    func conCount(cat: ContactsCategory) -> String {
        switch cat {
        case .all: return fetchAllContacts()
        case .repeats: return fetchDuplicateNames()
        case .duplicates: return fetchDuplicateNumbers()
        case .withoutNames: return fethWithoutNameContacts()
        case .withoutNumbers: return fetchWithoutNumber()
        case .withoutEmail: return fetchWithoutEmail()
        }
        
    }
    
    func fetchContacts() {
        
    }
}
