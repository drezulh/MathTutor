//
//  Views:Modifiers.swift
//  Multiplication-Edutainment
//
//  Created by Gorkem Turan on 29.12.2022.
//

import Foundation
import SwiftUI

struct StartButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.green)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.black, lineWidth: 1))
            .font(.title)
//            .padding(.top, 10)
            .foregroundColor(.black)
        
    }
}

extension View {
    
    func StartButtonGreen() -> some View {
        self.modifier(StartButton())
    }
}

struct EndButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.purple)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.black, lineWidth: 1))
            .font(.title)
//            .padding(.top, 10)
            .foregroundColor(.black)
        
    }
}

extension View {
    
    func EndButtonPurple() -> some View {
        self.modifier(EndButton())
    }
}



struct Pickers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .pickerStyle(.segmented)
            .colorMultiply(.red)
            .padding(.bottom, 50)
    }
}

extension View {
    func gamePickers() -> some View {
        self.modifier(Pickers())
    }
}

struct Label: ViewModifier  {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.black, lineWidth: 1)
            )
//            .padding(.bottom, 10)
//            .padding(.top, 50)
            .lineLimit(3)
    }
}

extension View {
    func gameLabel() -> some View {
        self.modifier(Label())
    }
}
