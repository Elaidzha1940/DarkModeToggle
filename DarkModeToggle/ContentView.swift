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
        .cornerRadius(50)
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
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 40)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .frame(width: 100, height: 42)
                .offset(x: configuration.isOn ? 50 : -50)
                .shadow(
                    color: .black.opacity(0.5),
                    radius: 10,
                    x: 10,
                    y: 10)
            
            HStack {
                Text("Light")
                    .font(
                        .system(size: 20,
                                weight: .bold,
                                design: .rounded))
                Spacer()
                
                Text("Dark")
                    .font(
                        .system(size: 20,
                                weight: .bold,
                                design: .rounded))
                    .foregroundStyle(.white)
            }
            .frame(width: 135)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    configuration.isOn.toggle()
                }
            }
        }
    }
}
