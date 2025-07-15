//
//  DarkAndLightMode.swift
//  TrollLibrary
//
//  Created by Matty on 03/12/2023.
//

import SwiftUI

enum DarkLightStyle {
    case standard
    case Effect
    
    struct Modifier: ViewModifier {
        @Binding var hasDarkModeActivated: Bool
        let style: DarkLightStyle
        
        func body(content: Content) -> some View {
            switch style {
            case .standard:
                content.modifier(StandardDarkModeModifier(hasDarkModeActivated: $hasDarkModeActivated))
            case .Effect:
                content.modifier(AdvancedDarkModeModifier(hasDarkModeActivated: $hasDarkModeActivated))
            }
        }
    }
    
    private struct StandardDarkModeModifier: ViewModifier {
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
    
    private struct AdvancedDarkModeModifier: ViewModifier {
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
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(15)
                                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 5, y: 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4),  Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                                            .shadow(color: .white.opacity(0.6), radius: 10, x: -2, y: -2)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                    )
                                    .scaleEffect(1.1)
                            }
                            .frame(width: 80, height: 80)
                            .animation(.easeInOut(duration: 0.3), value: hasDarkModeActivated)
                            Spacer()
                        }
                    }
                        .padding(.top, 44)
                        .padding(.trailing, 20)
                )
        }
    }
}

extension View {
    func darkLightModeToggle(hasDarkModeActivated: Binding<Bool>, style: DarkLightStyle) -> some View {
        modifier(DarkLightStyle.Modifier(hasDarkModeActivated: hasDarkModeActivated, style: style))
    }
}
