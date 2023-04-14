//
//  PhoneContacts.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import Foundation
import ContactsUI

class PhoneContacts {
    
    static let shared = PhoneContacts()
    
    
     func getContacts(filter: ContactsCategory = .all) -> [CNContact] {

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
    
   private func findDuplicateContactsName(Contacts contacts : [CNContact], completionHandler : @escaping (_ result : [Array<CNContact>]) -> ()){
        let arrfullNames : [String?] = contacts.map{CNContactFormatter.string(from: $0, style: .fullName)}
        var contactGroupedByDuplicated : [Array<CNContact>] = [Array<CNContact>]()
        if let fullNames : [String] = arrfullNames as? [String]{
            let uniqueArray = Array(Set(fullNames))
            var contactGroupedByUnique = [Array<CNContact>]()
            for fullName in uniqueArray {
                let group = contacts.filter {
                    CNContactFormatter.string(from: $0, style: .fullName) == fullName
                }
                contactGroupedByUnique.append(group)
            }
            for items in contactGroupedByUnique{
                if items.count > 1 {
                    contactGroupedByDuplicated.append(items)
                }
            }
        }
        completionHandler(contactGroupedByDuplicated)
    }
    
    func dublicateNames() -> String {
        let contacts = getContacts()
        var dublicates = 10
        findDuplicateContactsName(Contacts: contacts) { result in
            print(result)
            dublicates = result.count
            print(result.count)
        }
        return "\(dublicates)"
    }
//    func findDuplicateContactsNumbers(Contacts contacts : [CNContact], completionHandler : @escaping (_ result : [Array<CNContact>]) -> ()){
//        let arrfullNames : [String?] = contacts.map{CNContactFormatter.string(from: $0, style: .fullName)}
//        var contactGroupedByDuplicated : [Array<CNContact>] = [Array<CNContact>]()
//        if let fullNames : [String] = arrfullNames as? [String]{
//            let uniqueArray = Array(Set(fullNames))
//            var contactGroupedByUnique = [Array<CNContact>]()
//            for fullName in uniqueArray {
//                let group = contacts.filter {
//                    CNContactFormatter.string(from: $0, style: .fullName) == fullName
//                }
//                contactGroupedByUnique.append(group)
//            }
//            for items in contactGroupedByUnique{
//                if items.count > 1 {
//                    contactGroupedByDuplicated.append(items)
//                }
//            }
//        }
//        completionHandler(contactGroupedByDuplicated)
//    }
}

import Foundation
import ContactsUI

class PhoneContact: NSObject {

    var name: String?
    var avatarData: Data?
    var phoneNumber: [String] = [String]()
    var email: [String] = [String]()
    var isSelected: Bool = false
    var isInvited = false

    init(contact: CNContact) {
        name        = contact.givenName + " " + contact.familyName
        avatarData  = contact.thumbnailImageData
        for phone in contact.phoneNumbers {
            phoneNumber.append(phone.value.stringValue)
        }
        for mail in contact.emailAddresses {
            email.append(mail.value as String)
        }
    }

    override init() {
        super.init()
    }
}
