//
//  PresenationsExampleView.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 9/26/24.
//
import SwiftUI


struct PresenationsExampleView: View {
    @State private var showConfirmationDialog = false
    @State private var showAlert = false
    var body: some View {
        VStack {
            Button("Show Options") {
                showConfirmationDialog = true
            }
            .confirmationDialog("Choose an Action", isPresented: $showConfirmationDialog) {
                Button("Perform Action") {
                    
                }
                Button("Show Alert") {
                    showAlert = true
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("What would you like to do?")
            }
            .alert("This is an alert", isPresented: $showAlert) {
                Button("Cancel", role: .destructive) {
                    
                }
                Button("OK") {
                
                }
                Button("something") {
                    
                }
            } message: {
                Text("You have triggered an alert!")
            }
        }
    }
}

#Preview {
    PresenationsExampleView()
}
