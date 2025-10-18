//
//  TabRouter.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

@MainActor
protocol TabRouterProtocol {
    var activeTab: Tab { get }
    func navigate(to tab: Tab)
    func createTabViewBinding() -> Binding<Tab>
}

@MainActor
@Observable final class TabRouter: TabRouterProtocol {
    private(set) var activeTab: Tab = .home
    private(set) var animateSymbol: [Tab: Bool] = [.home: false, .groups: false, .profile: false, .settings: false]

    func navigate(to tab: Tab) {
        if tab == activeTab {
            tab.router.root()
        } else {
            self.activeTab = tab
        }
        
        self.animateSymbol[tab]?.toggle()
    }

    func createTabViewBinding() -> Binding<Tab> {
        Binding<Tab>(
            get: { [unowned self] in
                self.activeTab
            },
            set: { @Sendable newValue in
                // Ensure we execute on the main actor, since TabRouter is @MainActor.
                Task { @MainActor in
                    self.navigate(to: newValue)
                }
            }
        )
    }
}

