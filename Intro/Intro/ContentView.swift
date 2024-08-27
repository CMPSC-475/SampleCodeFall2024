//
//  ContentView.swift
//  Intro
//
//  Created by Nader Alfares on 8/27/24.
//

import SwiftUI

struct Student {
    var name : String
    var id : String
}

struct ContentView: View {
    
    private var students : [Student] = [
        Student(name: "John", id: "1"),
        Student(name: "Alex", id: "2"),
        Student(name: "Mike", id:"3")
        
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(students, id:\.id) { student in
                    Text(student.name)
                }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
