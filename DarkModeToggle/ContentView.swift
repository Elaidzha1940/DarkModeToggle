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
                .foregroundStyle(
                isDarkMode
                ? Color.white
                : Color(Color("OR"))
                )
                .frame(width: 140, height: 140)
                .overlay(alignment: .topTrailing) {
                    if !isDarkMode{
//                        Circle()
//                            .frame(width: 20, height: 20)
//                            .offset(x: 10, y: 15)
                    } else {
                        Circle()
                            .foregroundStyle(Color("Dark"))
                            .frame(width: 105, height: 105)
                            .offset(x: 10, y: 15)
                    }
                }
            
            
            Toggle("", isOn: $isDarkMode)
                .toggleStyle(CustomToggleStyle())
                .padding()
        }
        .preferredColorScheme(.dark)
        .background(isDarkMode ? Color("Dark") : Color("Light"))
        .cornerRadius(20)
        .frame(width: 290, height: 250)
        .shadow(
            color: .black.opacity(0.2),
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
                .foregroundColor(configuration.isOn ? Color("BD") : Color("Light"))
                .frame(width: 100, height: 42)
                .offset(x: configuration.isOn ? 50 : -50)
                .shadow(
                    color: .black.opacity(0.4),
                    radius: 10,
                    x: 10,
                    y: 10)
            
            HStack {
                Text("Light")
                    .font(
                        .system(size: 20,
                                weight: .bold,
                                design: .rounded))
                    .foregroundStyle(configuration.isOn ? .gray : .black)

                Spacer()
                
                Text("Dark")
                    .font(
                        .system(size: 20,
                                weight: .bold,
                                design: .rounded))
                    .foregroundStyle(configuration.isOn ? .white : .gray)
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
