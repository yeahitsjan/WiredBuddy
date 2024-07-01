// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import SwiftUI

struct TipsView: View {
    @Binding public var isConnectionActive: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Label(LocalizedStringKey("header_ip_information"), systemImage: "network").bold()
            Text(LocalizedStringKey("descr_ip_information")).font(.footnote)
            Spacer()
            Divider()
            Label(LocalizedStringKey("header_prefcon_information"), systemImage: "trophy").bold()
            Text(LocalizedStringKey("descr_prefcon_information")).font(.footnote)
            Spacer()
        }.padding()
    }
}
