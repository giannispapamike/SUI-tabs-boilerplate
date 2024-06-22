//
//  ExampleViewWithData.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

struct ExampleViewWithData: View {
    @Environment(Router.self) private var router
    var text: String

    var body: some View {
        VStack(spacing: 20) {
            Text(text)
            Text("Nested Level: \(self.router.path.count)")
            NavigationHelperView()
                .environment(self.router)
        }
    }
}

#Preview {
    ExampleViewWithData(text: "SOME TEXT")
        .environment(Router())
}
