//
//  ExampleView.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

struct ExampleView: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text("Example View")
            Text("Nested Level: \(self.router.path.count)")
            NavigationHelperView()
                .environment(self.router)
        }
    }
}

#Preview {
    ExampleView()
        .environment(Router())
}
