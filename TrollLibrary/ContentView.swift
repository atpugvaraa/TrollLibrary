//
//  ContentView.swift
//  TrollLibrary
//
//  Created by Aarav Gupta on 03/12/23.
//

import SwiftUI
import Foundation

struct AppModel {
    var icons: String
    var name: String
    var developer: String
    var url: String
}

struct CreditsRow: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let link: URL?
}

extension View {
    func darkLightModeToggle(hasDarkLightModeActivated: Binding<Bool>) -> some View {
        modifier(DarkLightStyle.Modifier(hasDarkModeActivated: hasDarkLightModeActivated))
    }
}

struct ContentView: View {
    let customisation = [
        AppModel(icons: "Picasso", name: "Picasso", developer: "sourcelocation", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Picasso.ipa"),
        AppModel(icons: "misaka", name: "misaka", developer: "misakaProject", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/misaka.ipa"),
        AppModel(icons: "Helium", name: "Helium", developer: "leminlimez", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Helium.tipa"),
        AppModel(icons: "DynamicCow", name: "DynamicCow", developer: "Matteo Zappia", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/DynamicCowTS.ipa"),
    ]
    let usefulApps = [
        AppModel(icons: "Filza", name: "Filza", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Filza.ipa"),
        AppModel(icons: "AppsManager", name: "AppsManager", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/AppsManager.ipa"),
        AppModel(icons: "AppStore++", name: "AppStore++", developer: "CokePokes", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/AppStore++.ipa"),
        AppModel(icons: "AppsDump2", name: "AppsDump2", developer: "bswbw", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/AppsDump2.ipa"),
        AppModel(icons: "CocoaTop", name: "CocoaTop", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/CocoaTop.ipa")
    ]
    let entertainment = [
        AppModel(icons: "Streamer", name: "Streamer", developer: "StreamerApp", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Streamer.ipa"),
        AppModel(icons: "Spotify", name: "Spotify", developer: "Spotify++", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Spotify.ipa"),
        AppModel(icons: "YouTube", name: "Youtube", developer: "YTLitePlus", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/YTLitePlus.ipa")
    ]
    let emulators = [
        AppModel(icons: "Delta", name: "Delta", developer: "Riley Testut", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/Delta.ipa"),
        AppModel(icons: "PPSSPP", name: "PPSSPP", developer: "PPSSPP", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/PPSSPP.ipa"),
        AppModel(icons: "UTM", name: "UTM", developer: "UTMapp", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1/UTM.ipa"),
    ]
    
    let updates = [
        AppModel(icons: "TrollLibrary", name: "TrollLibrary", developer: "Aarav", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/TrollLibrary/releases/download/v1.0/TrollLibrary.ipa")
    ]
    
    let credits = [
        CreditsRow(name: "Aarav Gupta", role: "Main Dev", link: URL(string: "https://discord.com/users/852755623501758515")),
        CreditsRow(name: "Mattycbtw", role: "Helper Dev", link: URL(string: "https://twitter.com/mattycbtw")),
        //        CreditsRow(name: "Lrdsnow", role: "Repo System", link: URL(string: "https://github.com/Lrdsnow")),
        //        CreditsRow(name: "Donato Fiore", role: "Decryptor", link: URL(string: "https://github.com/donato-fiore")),
        CreditsRow(name: "Paisseon (Lilliana)", role: "Dylibs Injection", link:  URL(string: "https://github.com/Paisseon")),
    ]
    
    @AppStorage("DarkLight") private var hasDarkModeActivated: Bool = true
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section(header: Text("Customisation")) {
                        ForEach(customisation, id: \.name) { customisation in
                            AppRow(app: customisation, buttonString: "GET")
                        }
                    }
                    Section(header: Text("Useful Apps")) {
                        ForEach(usefulApps, id: \.name) { usefulApps in
                            AppRow(app: usefulApps, buttonString: "GET")
                        }
                    }
                    Section(header: Text("Entertainment")) {
                        ForEach(entertainment, id: \.name) { entertainment in
                            AppRow(app: entertainment, buttonString: "GET")
                        }
                    }
                    Section(header: Text("Emulators")) {
                        ForEach(emulators, id: \.name) { emulators in
                            AppRow(app: emulators, buttonString: "GET")
                        }
                    }
                }
                .navigationBarTitle("TrollLibrary")
            }
            .darkLightModeToggle(hasDarkModeActivated: $hasDarkModeActivated)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationView {
                InjectionView()
            }
            .darkLightModeToggle(hasDarkModeActivated: $hasDarkModeActivated)
            .tabItem {
                Label("Injection", systemImage: "wrench.fill")
            }
            .preferredColorScheme(hasDarkModeActivated ? .dark : .light)
            
            NavigationView {
                List {
                    Section(header: Text("Updates")) {
                        ForEach(updates, id: \.name) { setting in
                            AppRow(app: setting, buttonString: "Update")
                        }
                    }
                    Section(header: Text("Credits")) {
                        ForEach(credits) { credit in
                            CreditsRowView(credit: credit)
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
            .darkLightModeToggle(hasDarkModeActivated: $hasDarkModeActivated)
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .preferredColorScheme(hasDarkModeActivated ? .dark : .light)
    }
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
    
    struct CreditsRowView: View {
        var credit: CreditsRow
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(credit.name)
                        .font(.headline)
                    Text(credit.role)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if let link = credit.link {
                    Button(action: {
                        UIApplication.shared.open(link)
                    }) {
                        Text("VIEW")
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
            }
            .padding(.vertical, 8)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
