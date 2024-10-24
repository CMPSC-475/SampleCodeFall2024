//
//  StateManager+Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 10/22/24.
//

extension StatesManager {
    
    func sectionInfo(for sec: Sectioning) -> [SectionInfo] {
        switch sec {
        case .none:
            return [SectionInfo(title: "US States", identifiers: Set(theStates.map{$0.id}))]
        case .byName:
            return sectionInfo(kp: \USState.firstLetter)
        case .byDecade:
            return sectionInfo(kp: \USState.decadeAdmitted)
        }
    }
    
    func sectionInfo(kp: KeyPath<USState, String>) -> [SectionInfo] {
        let titles = Set(theStates.map{$0[keyPath: kp]})
        let info = titles.map {t in
            SectionInfo(title: t, identifiers: Set(theStates.filter {$0[keyPath: kp] == t}.map {$0.id}))
        }
        return info.sorted { $0.title < $1.title }
    }
}

