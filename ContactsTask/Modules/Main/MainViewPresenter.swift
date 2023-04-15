//
//  MainViewPresenter.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import Foundation
import ContactsUI
import Contacts


class MainPresenter: MainPresenterProtocol {

    weak var view: ViewProtocol?
    
    
    private var phoneContacts = PhoneContacts()
    private let cncontacts = PhoneContacts.getContacts()
    
    required init(view: ViewProtocol) {
        self.view = view
    }
    
    func conCount(cat: ContactsCategory) -> [CNContact] {
        switch cat {
        case .all: return fetchAllContacts()
        case .repeats: return fetchDuplicateNames()
        case .duplicates: return fetchDuplicateNumbers()
        case .withoutNames: return fethWithoutNameContacts()
        case .withoutNumbers: return fetchWithoutNumber()
        case .withoutEmail: return fetchWithoutEmail()
        }
    }
    
    func fetchContacts() -> [CNContact] {
        return cncontacts
    }
}

extension MainPresenter: FetchContactsCategory {
     func fetchAllContacts() -> [CNContact] {
        let countContacts = cncontacts
        return countContacts
    }
    
     func fethWithoutNameContacts() -> [CNContact] {
        var withoutNames: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.givenName.isEmpty {
                withoutNames.append(cncontact)
            }
        }
        return withoutNames
    }
    
     func fetchWithoutEmail() -> [CNContact] {
        var withoutEmail: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.emailAddresses.isEmpty {
                withoutEmail.append(cncontact)
            }
        }
        return withoutEmail

    }
    
     func fetchWithoutNumber() -> [CNContact] {
        var withoutNumber: [CNContact] = []
        
        for cncontact in cncontacts {
            if cncontact.phoneNumbers.isEmpty {
                withoutNumber.append(cncontact)
            }
        }
        return withoutNumber
    }

     func fetchDuplicateNumbers() -> [CNContact] {
        let singlePhones = Set(Dictionary(grouping: cncontacts, by: {$0.phoneNumbers}).filter{$0.1.count == 1}.map{$0.0})
        let duplicateNumbers = cncontacts.filter {!singlePhones.contains($0.phoneNumbers)}

        return duplicateNumbers
    }
    
     func fetchDuplicateNames() -> [CNContact] {
        let singlePhones = Set(Dictionary(grouping: cncontacts, by: {$0.givenName}).filter{$0.1.count == 1}.map{$0.0})
        let duplicateNames = cncontacts.filter {!singlePhones.contains($0.givenName)}
        return duplicateNames
    }


}
