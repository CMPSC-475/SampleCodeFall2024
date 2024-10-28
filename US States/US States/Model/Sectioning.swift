//
//  Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 10/22/24.
//

enum Sectioning: String, CaseIterable {
    case none = "None"
    case byName = "By Name"
    case byDecade = "By Decade"
}

struct SectionInfo : Identifiable, Hashable {
    let title : String
    let identifiers : Set<String>
    var id : String { title }
}

extension Sectioning {
    var keyPath : KeyPath<USState,String> {
        switch self {
        case .none: \USState.empty
        case .byName: \USState.firstLetter
        case .byDecade: \USState.decadeAdmitted
        }
    }
}


