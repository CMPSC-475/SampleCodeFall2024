//
//  StorageManager.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/17/24.
//

import Foundation


class StorageManager<T : Codable> {
    
    var modelData : T?
    var filename : String
    init(filename : String) {
        self.filename = filename
        let fileUrl = URL.documentsDirectory.appendingPathComponent(filename)
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            
            do {
                let content = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                modelData = try decoder.decode(T.self, from: content)
            } catch {
                print(error)
                modelData = nil
            }
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: "json")
        
        guard let url = url else {modelData = nil; return}
        
        do {
            let content = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            modelData = try decoder.decode(T.self, from: content)
        } catch {
            print(error)
            modelData = nil
        }
    
    }
    
    func save(components : T) {
        let encoder = JSONEncoder()
        let url = URL.documentsDirectory.appendingPathComponent(filename)
        do {
            let data = try encoder.encode(components)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    
    
}
