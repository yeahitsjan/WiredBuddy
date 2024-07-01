// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct GeneralView: View {
    @Binding public var isConnectionActive: Bool
    @Binding public var wiredBuddyImage: Int

    @Binding public var hideDockIcon: Bool
    @Binding public var onlyShowIcon: Bool
    @State public var launchOnStart = UserDefaults.standard.bool(forKey: "LaunchOnStart")
    @Binding public var hideIPinMenu: Bool
    @Binding public var colorStatus: Bool

    var body: some View {
        Form {
            LabeledContent(LocalizedStringKey("startup")) {
                Toggle(LocalizedStringKey("launch_on_start"), isOn: $launchOnStart)
                    .toggleStyle(.checkbox)
            }
            Divider()
            LabeledContent(LocalizedStringKey("behavior")) {
                Toggle(LocalizedStringKey("only_icon"), isOn: $onlyShowIcon)
                    .toggleStyle(.checkbox)
            }
            Text(LocalizedStringKey("descr_only_icon")).font(.footnote).foregroundColor(.secondary).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
            Toggle(LocalizedStringKey("hide_dock_icon"), isOn: $hideDockIcon)
                .toggleStyle(.checkbox)
            Text(LocalizedStringKey("descr_hide_dock_icon")).font(.footnote).foregroundColor(.secondary).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
            Toggle(LocalizedStringKey("hide_ip"), isOn: $hideIPinMenu)
                .toggleStyle(.checkbox)
                .disabled(onlyShowIcon ? true : false)
            Divider()
            Picker(LocalizedStringKey("menu_bar_symbol"), selection: $wiredBuddyImage) {
                ForEach(buddies) { buddy in
                    if isConnectionActive {
                        Image(systemName: buddy.imageActive)
                    } else {
                        Image(systemName: buddy.imageInactive)
                    }
                }
            }
            LabeledContent(LocalizedStringKey("colors")) {
                Toggle(LocalizedStringKey("colorize_status"), isOn: $colorStatus)
                    .toggleStyle(.checkbox)
                    .disabled(onlyShowIcon ? true : false)
            }
            Text(LocalizedStringKey("descr_colorize_status")).font(.footnote).foregroundColor(.secondary).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
            Spacer()
        }.padding()
        .onChange(of: wiredBuddyImage) { newBuddy in
            UserDefaults.standard.set(newBuddy, forKey: "Buddy")
        }
        .onChange(of: hideDockIcon) { opt in
            UserDefaults.standard.set(opt, forKey: "HideDockIcon")
        }
        .onChange(of: onlyShowIcon) { opt in
            UserDefaults.standard.set(opt, forKey: "IconMode")
        }
        .onChange(of: hideIPinMenu) { opt in
            UserDefaults.standard.set(opt, forKey: "HideIPinMenu")
        }
        .onChange(of: colorStatus) { opt in
            UserDefaults.standard.set(opt, forKey: "ColorizeStatus")
        }
    }
}
