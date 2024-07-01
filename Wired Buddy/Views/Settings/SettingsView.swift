// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct SettingsView: View {
    @Binding public var isConnectionActive: Bool
    @Binding public var wiredBuddyImage: Int

    @Binding public var onlyShowIcon: Bool
    @Binding public var hideIPinMenu: Bool
    @Binding public var colorStatus: Bool
    
    var body: some View {
        TabView {
            GeneralView(isConnectionActive: $isConnectionActive,
                        wiredBuddyImage: $wiredBuddyImage,
                        onlyShowIcon: $onlyShowIcon,
                        hideIPinMenu: $hideIPinMenu,
                        colorStatus: $colorStatus)
                .tabItem {
                    Label(LocalizedStringKey("general"), systemImage: "gearshape")
                }
            Text("dummy")
                .tabItem {
                    Label(LocalizedStringKey("hotkeys"), systemImage: "command")
                }
        }.frame(width: 450, height: 300)
    }
}
