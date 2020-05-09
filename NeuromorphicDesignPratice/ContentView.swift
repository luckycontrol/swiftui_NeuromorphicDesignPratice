//
//  ContentView.swift
//  NeuromorphicDesignPratice
//
//  Created by 조종운 on 2020/05/09.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var user = ""
    @State var pass = ""
    
    var body: some View {
        
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                
                VStack(spacing: 18) {
                    
                    Image("Logo")
                    Text("Name")
                }
                .padding(20)
                .padding(.bottom, 20)
                .modifier(TopModifier())
                
                HStack(spacing: 15) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    
                    TextField("Email", text: $user)
                }
                .modifier(TFModifier())
                
                HStack(spacing: 15) {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: $pass)
                    
                    Button(action: {}) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                }
                .modifier(TFModifier())
                
                Button(action: {}) {
                    Text("Login")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .buttonStyle(ButtonModifier())
                
                Text("(OR)")
                    .foregroundColor(.gray)
                
                HStack(spacing: 25) {
                    Button(action: {}) {
                        Image("fb")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(10)
                    }.buttonStyle(OtherModifier())
                    
                    Button(action: {}) {
                        Image("twitter")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(10)
                    }.buttonStyle(OtherModifier())
                }.padding(.top, 15)
                
            }
            .padding(.horizontal, 30)
        }
    }
}

struct TopModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.background(Color("Color"))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.5), radius: 6, x: -8, y: -8)
    }
}

struct TFModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color("Color"))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black.opacity(0.05), lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
        )
    }
}

struct ButtonModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color("Color"))
            .cornerRadius(15)
            .overlay(
                VStack {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black.opacity(0.05), lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.7), radius: 5, x: -5, y: -5)
    }
}

struct OtherModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color("Color"))
            .clipShape(Circle())
            .overlay(
                VStack {
                    if configuration.isPressed {
                        Circle()
                            .stroke(Color.black.opacity(0.05), lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(Circle())
                }
            }
        )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.7), radius: 5, x: -5, y: -5)
    }
}
