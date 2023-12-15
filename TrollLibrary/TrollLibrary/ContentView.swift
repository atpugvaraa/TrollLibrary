//
//  ContentView.swift
//  TrollLibrary
//
//  Created by Aarav Gupta on 03/12/23.
//
import SwiftUI
import UIKit

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    func toHexString() -> String {
        guard let components = UIColor(self).cgColor.components, components.count >= 3 else {
            return "#000000"
        }
        let r = components[0]
        let g = components[1]
        let b = components[2]
        return String(format: "#%02lX%02lX%02lX", lround(Double(r * 255)), lround(Double(g * 255)), lround(Double(b * 255)))
    }
}

struct AppModel {
    var icons: String
    var name: String
    var developer: String
    var url: String
}

extension View {
    func darkLightModeToggle(hasDarkLightModeActivated: Binding<Bool>, style: DarkLightStyle) -> some View {
        modifier(DarkLightStyle.Modifier(hasDarkModeActivated: hasDarkLightModeActivated, style: style))
    }
}

struct ContentView: View {
    
    let featuredApps = [
        AppModel(icons: "Picasso", name: "Picasso", developer: "sourcelocation", url: "https://discord.gg/CAFtgn2emJ"),
        
        AppModel(icons: "misaka", name: "misaka", developer: "misakaProject", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/misaka.ipa"),
        
        AppModel(icons: "Spotify", name: "Spotify", developer: "Spotify++", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Spotify.ipa"),
        
        AppModel(icons: "YouTube", name: "Youtube", developer: "uYouPlusExta", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/uYouPlusExtra.ipa"),
        
    ]
    
    let mostUsedApps =  [
        AppModel(icons: "Filza", name: "Filza", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Filza.ipa"),
        
        AppModel(icons: "AppsManager", name: "AppsManager", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppsManager.ipa"),
        
        AppModel(icons: "AppStore++", name: "AppStore++", developer: "CokePokes", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppStore++.ipa"),
        
        AppModel(icons: "AppsDump2", name: "AppsDump2", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppDump2.ipa"),
    ]
    
    
    let collection = [
        AppModel(icons: "AirTroller", name: "AirTroller", developer: "sourcelocation", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AirTroller.tipa"),
        
        AppModel(icons: "AppsDump2", name: "AppsDump2", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppDump2.ipa"),
        
        AppModel(icons: "AppsManager", name: "AppsManager", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppsManager.ipa"),
        
        AppModel(icons: "AppStore++", name: "AppStore++", developer: "CokePokes", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppStore++.ipa"),
        
        AppModel(icons: "BlackHole", name: "BlackHole", developer: "sangwan5688", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/BlackHole.ipa"),
        
        AppModel(icons: "DebtoIpa", name: "DebToiPA", developer: "sourcelocation", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/DebToIPA.ipa"),
        
        AppModel(icons: "Delta", name: "Delta", developer: "Riley Testut", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Delta.ipa"),
        
        AppModel(icons: "Discord", name: "Discord", developer: "Vendetta", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Discord.ipa"),
        
        AppModel(icons: "DolphiniOS", name: "DolphiniOS", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/DolphiniOS.ipa"),
        
        AppModel(icons: "E-Sign", name: "E-Sign", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/ESign.ipa"),
        
        AppModel(icons: "Filza", name: "Filza", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Filza.ipa"),
        
        AppModel(icons: "misaka", name: "misaka", developer: "misakaProject", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/misaka.ipa"),
        
        AppModel(icons: "Picasso", name: "Picasso", developer: "sourcelocation", url: "https://discord.gg/CAFtgn2emJ"),
        
        AppModel(icons: "PPSSPP", name: "PPSSPP", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/PPSSPP.ipa"),
        
        AppModel(icons: "Spotify", name: "Spotify", developer: "Spotify++", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Spotify.ipa"),
        
        AppModel(icons: "TrollBox", name: "TrollBox", developer: "c22dev", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/TrollBox.tipa"),
        
        AppModel(icons: "UTM", name: "UTM", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/UTM.ipa"),
        
        AppModel(icons: "Whatsapp", name: "Whatsapp", developer: "Watusi", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Watusi.ipa"),
        
        AppModel(icons: "YouTube", name: "YouTube", developer: "uYouPlusExtra", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/uYouPlusExtra.ipa"),
        
        AppModel(icons: "YTMusic", name: "YTMusic", developer: "YTMusicUltimate", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/YTMusicUltimate.ipa")
    ]
    
    let updates = [
        AppModel(icons: "TrollLibrary", name: "TrollLibrary", developer: "Aarav", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/TrollLibrary/releases/download/v1.0/TrollLibrary.ipa")
    ]
    
    let settings = [
        AppModel(icons: "MainDeveloper", name: "Aarav - Main Dev", developer: "(@atpugvaraa)", url: "https://twitter.com/atpugvaraa"),
        AppModel(icons: "Mattycbtw", name: "Mattycbtw - Helper/Dev", developer: "(@Mattycbtw)", url: "https://twitter.com/mattycbtw")
    ]
    
    
    @AppStorage("DarkLight") private var hasDarkModeActivated: Bool = true
       @AppStorage("layout") private var uiStyleString: String = UIStyle.Standard.rawValue
       
       var body: some View {
           TabView {
               NavigationView {
                   List {
                       Section(header: Text("Featured Apps")) {
                           ForEach(featuredApps, id: \.name) { featuredApp in
                               AppRow(app: featuredApp, buttonString: "GET")
                           }
                    }
                    
                    Section(header: Text("Most Used")) {
                        ForEach(mostUsedApps, id: \.name) { mostUsed in
                            AppRow(app: mostUsed, buttonString: "GET")
                        }
                        
                    }
                }
                .navigationBarTitle("TrollLibrary")
                
            }
               .preferredColorScheme(hasDarkModeActivated ? .dark : .light)
            .tabItem {
                Image(systemName: "star.fill")
                Text("Featured")
            }
            
            NavigationView {
                List {
                    Section(header: Text("Collection")) {
                        ForEach(collection, id: \.name) { collection in
                            AppRow(app: collection, buttonString: "GET")
                        }
                    }
                }
                .navigationBarTitle("All Apps")
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill")
                Text("All Apps")
            }
            
            NavigationView {
                List {
                    Section(header: Text("Updates")) {
                        ForEach(updates, id: \.name) { setting in
                            AppRow(app: setting, buttonString: "Update")
                        }
                   }
                    
                    Section(header: Text("Developers")) {
                        ForEach(settings, id: \.name) { setting in
                            AppRow(app: setting, buttonString: "VIEW")
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .preferredColorScheme(hasDarkModeActivated ? .dark : .light)
    }
    
    
    enum UIStyle: String {
           case Standard = "Standard"
       }
       
       struct AppRow: View {
           var app: AppModel
           var buttonString: String
           
           var body: some View {
               HStack {
                   Image(app.icons)
                       .resizable()
                       .frame(width: 60, height: 60)
                       .cornerRadius(12)
                   
                   VStack(alignment: .leading) {
                       Text(app.name)
                           .font(.headline)
                       Text(app.developer)
                           .font(.subheadline)
                           .foregroundColor(.gray)
                   }
                   
                   Spacer()
                   
                   Button(action: {
                       if let url = URL(string: app.url) {
                           UIApplication.shared.open(url)
                       }
                   }) {
                       Text("GET")
                           .font(.headline)
                           .bold()
                           .foregroundColor(.blue)
                           .padding(.horizontal, 20)
                           .padding(.vertical, 6)
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(20)
                   }
                   .buttonStyle(PlainButtonStyle())
               }
               .padding(.vertical, 8)
           }
       }
       
       struct ContentView_Previews: PreviewProvider {
           static var previews: some View {
               ContentView()
           }
       }
   }
