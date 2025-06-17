//
//  DarkAndLightMode.swift
//  TrollLibrary
//
//  Created by Matty on 03/12/2023.
//

import SwiftUI

enum DarkLightStyle {
    struct Modifier: ViewModifier {
        @Binding var hasDarkModeActivated: Bool
        
        func body(content: Content) -> some View {
            content
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    hasDarkModeActivated.toggle()
                                }
                            } label: {
                                Image(systemName: hasDarkModeActivated ? "sun.max.fill" : "moon.fill")
                                    .foregroundColor(hasDarkModeActivated ? .white : .black)
                                    .padding(20)
                                    .scaleEffect(1.1)
                            }
                            .frame(width: 80, height: 30)
                            .animation(.easeInOut(duration: 0.3), value: hasDarkModeActivated)
                            Spacer()
                        }
                    }
                    .padding(.top, 8)
                    .padding(.trailing, 20)
                )
        }
    }
}

extension View {
    func darkLightModeToggle(hasDarkModeActivated: Binding<Bool>) -> some View {
        modifier(DarkLightStyle.Modifier(hasDarkModeActivated: hasDarkModeActivated))
    }
}
