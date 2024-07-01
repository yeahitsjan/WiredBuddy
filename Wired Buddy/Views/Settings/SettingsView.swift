// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct SettingsView: View {
    @Binding public var isConnectionActive: Bool
    @Binding public var wiredBuddyImage: Int

    @Binding public var hideDockIcon: Bool
    @Binding public var onlyShowIcon: Bool
    @Binding public var hideIPinMenu: Bool
    @Binding public var colorStatus: Bool
    
    var body: some View {
        TabView {
            GeneralView(isConnectionActive: $isConnectionActive,
                        wiredBuddyImage: $wiredBuddyImage,
                        hideDockIcon: $hideDockIcon,
                        onlyShowIcon: $onlyShowIcon,
                        hideIPinMenu: $hideIPinMenu,
                        colorStatus: $colorStatus)
                .tabItem {
                    Label(LocalizedStringKey("general"), systemImage: "gearshape")
                }
            TipsView(isConnectionActive: $isConnectionActive)
                .tabItem {
                    Label(LocalizedStringKey("tips"), systemImage: "lightbulb.max")
                }
        }.frame(width: 450, height: 300)
        .onAppear() {
            for window in NSApplication.shared.windows {
                if window.identifier?.rawValue == "com_apple_SwiftUI_Settings_window" {
                    window.level = .floating
                }
            }
        }
    }
}
