//
//  StateManager+Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 10/22/24.
//

extension StatesManager {
    
    func sectionInfo() -> [SectionInfo] {
        let titles = Set(theStates.map{$0.firstLetter})
        let info = titles.map {t in
            SectionInfo(title: t, identifiers: Set(theStates.filter {$0.firstLetter == t}.map {$0.id}))
        }
        return info
    }
}

