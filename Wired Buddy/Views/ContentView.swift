// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI
import MacControlCenterUI
import SettingsAccess

struct ContentView: View {
    @Binding public var isMenuPresented: Bool
    @Binding public var isWiredConnection: Bool
    @Binding public var isPreferred: Bool
    @Binding public var interfaceName: String?
    
    @State public var isInfoSectionExpanded: Bool = true
    @Binding public var currentIpAddr: String

    @Binding public var onlyShowIcon: Bool 
    @Binding public var hideIPinMenu: Bool
    @Binding public var colorStatus: Bool

    @Binding public var tabSelection: Int

    @Environment(\.openURL) var openURL
    @Environment(\.openSettings) var openSettings
    
    var body: some View {
        MacControlCenterMenu(isPresented: $isMenuPresented) {
            if !onlyShowIcon {
                MenuHeader(LocalizedStringKey("ethernet")) {
                    if interfaceName != nil {
                        Text(interfaceName!).font(.footnote).foregroundColor(.secondary)
                    }
                }

                MenuToggle(isOn: .constant(isWiredConnection), image: isWiredConnection ? Image(systemName: "network") : Image(systemName: "network.slash")) {
                    if isPreferred {
                        Text(LocalizedStringKey("eth_is_connected")).foregroundColor(colorStatus ? .green : nil)
                    } else {
                        Text(LocalizedStringKey("eth_not_connected")).foregroundColor(colorStatus ? .red : nil)
                    }
                }
                
                MenuDisclosureSection(LocalizedStringKey("informations"), isExpanded: $isInfoSectionExpanded) {
                    if !hideIPinMenu {
                        MenuToggle(isOn: .constant(isWiredConnection), image: Image(systemName: "externaldrive.connected.to.line.below")) {
                            Text("IPv4: \(currentIpAddr)")
                        } onClick: { _ in
                            tabSelection = 1
                            openSettingsView()
                        }
                    }
                    MenuToggle(isOn: .constant(isWiredConnection), image: isPreferred ? Image(systemName: "trophy") : Image(systemName: "exclamationmark.triangle")) {
                        Text(isPreferred ? LocalizedStringKey("eth_preferred") : LocalizedStringKey("eth_not_preferred"))
                    } onClick: { _ in
                        tabSelection = 1
                        openSettingsView()
                    }
                }

                Divider()
            }
            MenuCommand(LocalizedStringKey("network_prefs")) {
                // com.apple.preference.network
                openURL(URL(string: "x-apple.systempreferences:com.apple.Network-Settings.extension")!)
            }
            Divider()
            // Preferences
            MenuCommand(LocalizedStringKey("preferences")) {
                tabSelection = 0
                openSettingsView()
            }
            // About
            MenuCommand(LocalizedStringKey("about")) {
                tabSelection = 2
                openSettingsView()
            }
            Divider()
            // Quit
            MenuCommand(LocalizedStringKey("quit")) {
                NSApplication.shared.terminate(nil)
            }
        }
    }

    private func openSettingsView() {
        try? openSettings()
    }
}
