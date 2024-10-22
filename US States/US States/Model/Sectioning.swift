//
//  Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 10/22/24.
//

enum Sectioning {
    case none, byName, byDecade
}

struct SectionInfo : Identifiable, Hashable {
    let title : String
    let identifiers : Set<String>
    var id : String { title }
}


