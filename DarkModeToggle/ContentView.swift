//  /*
//
//  Project: DarkModeToggle
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 03.10.2023
//
//  */

import SwiftUI

struct ContentView: View {
    @State var isDarkMode: Bool = false
    
    var body: some View {
        
        VStack {
          
            VStack {
                
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 15)
            Circle()
            Toggle("", isOn: $isDarkMode)
                .toggleStyle(CustomToggleStyle())
                .padding()
        }
        .background(.white)
        .frame(width: 290, height: 250)
        .cornerRadius(20)
        .shadow(
            color: .black.opacity(0.5),
            radius: 10,
            x: 10,
            y: 10)
    }
}

#Preview {
    ContentView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
        }
    }
}
