//
//  NavigationHelperView.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

@MainActor
struct NavigationHelperView: View {
    @Environment(Router.self) private var router
    var tabRouter = DefaultRouters.tabRouter

    var body: some View {
        VStack(spacing: 20) {
            Button("Navigate to Nested Example View") {
                self.router.navigate(to: .exampleView)
            }

            Button("Navigate to Nested Example View With Data") {
                self.router.navigate(to: .exampleViewWithData(text: "SOME TEXT"))
            }

            Button("Navigate to Nested Common View") {
                self.router.navigate(to: .common(.exampleCommonView))
            }

            Button("Go Back One Level") {
                self.router.back()
            }

            Button("Go Back Two Levels") {
                self.router.back(by: 2)
            }

            Button("Back to Root") {
                self.tabRouter.activeTab.router.root()
            }
        }
        .buttonStyle(BorderedButtonStyle())
    }
}

#Preview {
    NavigationHelperView()
        .environment(Router())
}
