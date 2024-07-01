// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI
import MenuBarExtraAccess
import SettingsAccess

@main
struct WiredBuddyApp: App {
    @State public var isMenuPresented: Bool = false

    @StateObject var netMon = WBNetworkMonitor()
    @State public var wiredBuddyImage = UserDefaults.standard.integer(forKey: "Buddy")

    @State public var onlyShowIcon = UserDefaults.standard.bool(forKey: "IconMode")
    @State public var hideIPinMenu = UserDefaults.standard.bool(forKey: "HideIPinMenu")
    @State public var colorStatus = UserDefaults.standard.bool(forKey: "ColorizeStatus")
    
    var body: some Scene {
        Settings {
            SettingsView(isConnectionActive: $netMon.isWiredConnection,
                            wiredBuddyImage: $wiredBuddyImage,
                            onlyShowIcon: $onlyShowIcon,
                            hideIPinMenu: $hideIPinMenu,
                            colorStatus: $colorStatus)
        }
        MenuBarExtra("Wired Buddy", systemImage: netMon.isWiredConnection ? buddies[wiredBuddyImage].imageActive : buddies[wiredBuddyImage].imageInactive) {
            ContentView(isMenuPresented: $isMenuPresented, isWiredConnection: $netMon.isWiredConnection, isPreferred: $netMon.isPreferred, interfaceName: $netMon.interfaceName,
                        currentIpAddr: $netMon.ipAddr,
                        onlyShowIcon: $onlyShowIcon,
                        hideIPinMenu: $hideIPinMenu,
                        colorStatus: $colorStatus)
                .openSettingsAccess()
        }.menuBarExtraStyle(.window).menuBarExtraAccess(isPresented: $isMenuPresented)
    }
}
