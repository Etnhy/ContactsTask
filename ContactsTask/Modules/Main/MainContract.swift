//
//  MainContracts.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 15.04.2023.
//

import Foundation
import Contacts
import ContactsUI


protocol ViewProtocol: AnyObject {
}

protocol MainPresenterProtocol: AnyObject {
    init(view: ViewProtocol)
        func fetchContacts() -> [CNContact]
}

protocol FetchContactsCategory: AnyObject {
    func fetchAllContacts()         -> [CNContact]
    func fethWithoutNameContacts()  -> [CNContact]
    func fetchWithoutEmail()        -> [CNContact]
    func fetchWithoutNumber()       -> [CNContact]
    func fetchDuplicateNumbers()    -> [CNContact]
    func fetchDuplicateNames()      -> [CNContact]
}
