//
//  PhoneContacts.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import Foundation
import ContactsUI

class PhoneContacts {
    class func getContacts() -> [CNContact] {

            let contactStore = CNContactStore()
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactPhoneNumbersKey,
                CNContactEmailAddressesKey,
                CNContactThumbnailImageDataKey] as [Any]

            var allContainers: [CNContainer] = []
            do {
                allContainers = try contactStore.containers(matching: nil)
            } catch {
                print("Error fetching containers")
            }

            var results: [CNContact] = []

            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

                do {
                    let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                    results.append(contentsOf: containerResults)
                } catch {
                    print("Error fetching containers")
                }
            }
            return results
        }
}

//extension PhoneContacts: FetchContactsCategory {
//    func fetchAllContacts() -> [CNContact] {
//        return self.getContacts()
//    }
//    func fethWithoutNameContacts() -> [CNContact] {
//        var withoutNames: [CNContact] = []
//        
//        for cncontact in self.getContacts() {
//            if cncontact.givenName.isEmpty {
//                withoutNames.append(cncontact)
//            }
//        }
//        return withoutNames
//    }
//    
//    func fetchWithoutEmail() -> [CNContact] {
//        var withoutEmail: [CNContact] = []
//        
//        for cncontact in self.getContacts() {
//            if cncontact.emailAddresses.isEmpty {
//                withoutEmail.append(cncontact)
//            }
//        }
//        return withoutEmail
//
//    }
//    
//    func fetchWithoutNumber() -> [CNContact] {
//        var withoutNumber: [CNContact] = []
//        
//        for cncontact in self.getContacts() {
//            if cncontact.phoneNumbers.isEmpty {
//                withoutNumber.append(cncontact)
//            }
//        }
//        return withoutNumber
//
//    }
//    
//    func fetchDuplicateNumbers() -> [CNContact] {
//        
//    }
//    
//    func fetchDuplicateNames() -> [CNContact] {
//        
//    }
//    
//    
//}
