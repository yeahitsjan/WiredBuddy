// Copyright (c) 2024-2026 Jan Strumpen <jan@strumpen.dev>. Licensed under the MIT License.

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Image("appicon128").resizable().frame(width: 64, height: 64)
            Text(LocalizedStringKey("welcome_header")).padding(2).font(.system(size: 12, design: .monospaced))
            Text(LocalizedStringKey("welcome_description")).multilineTextAlignment(.center).font(.system(size: 10, design: .monospaced))
        }.foregroundStyle(.secondary).padding()
    }
}
