// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct TipsView: View {
    @Binding public var isConnectionActive: Bool
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Label(LocalizedStringKey("descr_ip_header"), systemImage: "network").bold()
                Text(LocalizedStringKey("descr_ip")).font(.footnote)
            }.padding()
            Divider()
            VStack(alignment: .leading) {
                Label(LocalizedStringKey("descr_preferred_header"), systemImage: "trophy").bold()
                Text(LocalizedStringKey("descr_preferred")).font(.footnote)
            }.padding()
            Spacer()
        }.padding()
    }
}
