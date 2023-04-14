//
//  MainTableViewModel.swift
//  ContactsTask
//
//  Created by Evhenii Mahlena on 14.04.2023.
//

import Foundation


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
//    var cout: String {
//        switch self {
//        case .all: return "\(10)"
//        case .repeats: return "\(4)"
//        case .duplicates: return "\(2)"
//        case .withoutNames: return "\(0)"
//        case .withoutNumbers: return "\(6)"
//        case .withoutEmail: return "\(0)"
//        }
//    }
}
