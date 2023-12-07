//
//  ContentView.swift
//  TrollLibrary
//
//  Created by Aarav Gupta on 03/12/23.
//
import SwiftUI

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
        
        AppModel(icons: "Misaka", name: "misaka", developer: "misakaProject", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/misaka-v3.2.8.ipa"),
        
        AppModel(icons: "Spotify", name: "Spotify", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/SpotifyDeluxeOld-8.6.94.ipa"),
        
        AppModel(icons: "YouTube", name: "uYouPlus", developer: "qnblackcat", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/uYouPlusExtra-18.46.3-3.0.1-F1.ipa"),
        
    ]
    
    let mostUsedApps =  [
        AppModel(icons: "Filza", name: "Filza", developer: "", url: "apple-magnifier://install?url=https://tigisoftware.com/download/Filza_NoURLScheme_4.0.0.ipa"),
        
        AppModel(icons: "AppsManager", name: "AppsManager", developer: "TigiSoftware", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppsManager_1.8.4.ipa"),
        
        AppModel(icons: "AppStore++", name: "AppStore++", developer: "CokePokes", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppStore++_TrollStore_v1.0.3-2.ipa"),
        
        AppModel(icons: "AppsDump2", name: "AppsDump2", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/AppDump2-2.0.ipa"),
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
        
        AppModel(icons: "Filza", name: "Filza", developer: "", url: " apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Filza.ipa"),
        
        AppModel(icons: "Misaka", name: "misaka", developer: "misakaProject", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/misaka.ipa"),
        
        AppModel(icons: "Picasso", name: "Picasso", developer: "sourcelocation", url: "https://discord.gg/CAFtgn2emJ"),
        
        AppModel(icons: "PPSSPP", name: "PPSSPP", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/PPSSPP.ipa"),
        
        AppModel(icons: "Spotify", name: "Spotify", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Spotify.ipa"),
        
        AppModel(icons: "TrollBox", name: "TrollBox", developer: "c22dev", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/TrollBox.tipa"),
        
        AppModel(icons: "UTM", name: "UTM", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/UTM.ipa"),
        
        AppModel(icons: "YouTube", name: "uYouPlus", developer: "qnblackcat", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/uYouPlusExtra-18.46.3-3.0.1-F1.ipa"),
        
        AppModel(icons: "Watusi", name: "Watusi", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/Watusi3-23.24.73-1.2.10-3.4.4.ipa"),
        
        AppModel(icons: "YTMusic", name: "YTMusic", developer: "", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/AppLibrary/releases/download/v1.0.0/YTMusicUltimate.ipa")
    ]
    
    let updates = [
        AppModel(icons: "TrollLibrary", name: "TrollLibrary", developer: "Aarav", url: "apple-magnifier://install?url=https://github.com/atpugvaraa/TrollLibrary/releases/download/v1.0/TrollLibrary.ipa")
    ]
    
    let settings = [
        AppModel(icons: "MainDeveloper", name: "Aarav - Main Dev", developer: "(@atpugvaraa)", url: "https://twitter.com/atpugvaraa"),
        AppModel(icons: "Mattycbtw", name: "Mattycbtw - Helper/Dev", developer: "(@Mattycbtw)", url: "https://twitter.com/mattycbtw"),
        //        AppModel(icons: "", name: "[PoopER) - App Icon", developer: "", url: "")
    ]
    
    
    @AppStorage("DarkLight") private var hasDarkModeActivated: Bool = true
    @AppStorage("layout") private var uiStyleString: String = UIStyle.Effect.rawValue
    @AppStorage("gradientStartColor") private var gradientStartColorHex: String = "#D3D3D3" //MARK: Default Color is light gray
    @AppStorage("gradientEndColor") private var gradientEndColorHex: String = "#D3D3D3" //MARK: Default color is light gray
    private var uiStyle: UIStyle {
        get { UIStyle(rawValue: uiStyleString) ?? .standard }
        set { uiStyleString = newValue.rawValue }
    }
    
    @AppStorage("darkmodeEnabled") private var isAdvancedDarkModeEnabled: Bool = true
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section(header: Text("Featured Apps")) {
                        ForEach(featuredApps, id: \.name) { featuredApp in
                            AppRow(app: featuredApp, buttonString: "GET")
                        }
                        //
                    }
                    
                    Section(header: Text("Most Used")) {
                        ForEach(mostUsedApps, id: \.name) { mostUsed in
                            AppRow(app: mostUsed, buttonString: "GET")
                        }
                        
                    }
                }
                .navigationBarTitle("TrollLibrary")
                
            }
            .darkLightModeToggle(hasDarkModeActivated: $hasDarkModeActivated, style: isAdvancedDarkModeEnabled ? .Effect : .standard)
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
                            AppRow(app: setting, buttonString: "Update", buttonWidth: 80)
                        }
                   }
                    
                    Section(header: Text("Developers")) {
                        ForEach(settings, id: \.name) { setting in
                            AppRow(app: setting, buttonString: "VIEW", buttonWidth: 80)
                        }
                    }
                    
                    Section(header: Text("Settings")) {
                        Toggle(isOn: Binding<Bool>(
                            get: { uiStyle == .standard },
                            set: { uiStyleString = $0 ? UIStyle.standard.rawValue : UIStyle.Effect.rawValue }
                        ), label: {
                            Text(uiStyle == .standard ? "Standard" : "3D Effect")
                        })
                        
                        if uiStyle == .Effect {
                            ColorPicker("Start Color", selection: Binding<Color>(
                                get: { Color(hex: gradientStartColorHex) },
                                set: { newValue in gradientStartColorHex = newValue.toHexString() }
                            ))
                            
                            ColorPicker("End Color", selection: Binding<Color>(
                                get: { Color(hex: gradientEndColorHex) },
                                set: { newValue in gradientEndColorHex = newValue.toHexString() }
                            ))
                        }
                        
                        Toggle(isAdvancedDarkModeEnabled ? "Disable Light/Dark Mode Button" : "Enable Light/Dark Mode Button", isOn: $isAdvancedDarkModeEnabled)
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
        case standard = "Standard"
        case Effect = "3D Effect"
    }
    
    struct AppRow: View {
        var app: AppModel
        var buttonString: String
        var buttonWidth: CGFloat?
        
        @AppStorage("layout") private var uiStyleString: String = UIStyle.standard.rawValue
        private var uiStyle: UIStyle {
            get { UIStyle(rawValue: uiStyleString) ?? .standard }
            set { uiStyleString = newValue.rawValue }
        }
        
        @AppStorage("gradientStartColor") private var gradientStartColorHex: String = "#333333" //MARK: Default Color is white
        //Made it darker
        @AppStorage("gradientEndColor") private var gradientEndColorHex: String = "#ffffff" //MARK: Default color is light gray
        @Environment(\.colorScheme) var colorScheme
        
        
        //MARK: Convert the hex string to color
        private var backgroundGradientStartColor: Color {
            Color(hex: gradientStartColorHex)
        }
        
        private var backgroundGradientEndColor: Color {
            Color(hex: gradientEndColorHex)
        }
        var body: some View {
            switch uiStyle {
            case .standard:
                StandardUI
            case .Effect:
                Effect3D
            }
        }
        
        var StandardUI: some View {
            HStack {
                Image(app.icons)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)
                
                VStack(alignment: .leading) {
                    Text(app.name)
                        .font(.headline)
                    Text(app.developer) // Use developer property
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    print("GET Tapped for \(app.name)")
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
        
        var Effect3D: some View {
            HStack(spacing: 6){
                Image(app.icons)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: -2.5, y: -2.5)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(app.name)
                        .font(.headline)
                    Text(app.developer)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .bold()
                        .italic()
                }
                
                Spacer()
                
                Button {
                    print("GET Tapped for \(app.name)")
                    if let url = URL(string: app.url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text(buttonString)
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 16)
                        .frame(width: buttonWidth)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]), startPoint: .leading, endPoint: .bottom))
                        .cornerRadius(20)
                        .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 5) // Reduce the shadow radius
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: gradientStartColorHex), Color(hex: gradientEndColorHex)]), startPoint: .top, endPoint: .bottom))
                    .shadow(radius: 5) // Reduce the shadow radius
            )
        }
        
        var adaptbackgroundColor: LinearGradient {
            LinearGradient(gradient: Gradient(colors: [colorScheme  == .dark ? .black : .white, colorScheme == .dark ? Color.gray.opacity(0.4) : Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            ContentView()
        }
    }
}
