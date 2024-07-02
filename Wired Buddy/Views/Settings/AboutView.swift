// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct AboutView: View {
    let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("appicon128")
            HStack {
                Text("Wired Buddy").bold()
                Text("\(version)").font(.footnote).foregroundColor(.secondary)
            }
            Text(LocalizedStringKey("copyright_note")).font(.footnote).foregroundColor(.secondary)
            VStack(alignment: .leading) {
                Text(LocalizedStringKey("about_oss"))
                Text(LocalizedStringKey("about_viewsource"))
                Text(LocalizedStringKey("about_sponsor"))
            }.padding(.vertical)
            Spacer()
        }.padding()
    }
}
