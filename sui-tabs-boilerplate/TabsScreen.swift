//
//  TabsScreen.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

struct TabsScreen: View {
    var tabRouter: TabRouter

    var body: some View {
        TabView(selection: tabRouter.createTabViewBinding()) {
            ForEach(Tab.allCases) { tab in
                if tab.isEnabled {
                    NavigationStack(path: tab.router.createRouterPathBinding()) {
                        tab.view
                            .environment(tab.router)
                            .navigationDestination(for: Routes.self, destination: tab.router.navigationHandler)
                            .navigationTitle(tab.rawValue.capitalized)
                            .navigationBarTitleDisplayMode(.large)
                            .toolbarBackground(.automatic, for: .navigationBar)
                            .toolbarBackgroundVisibility(.automatic, for: .navigationBar)
                    }
                    .tag(tab)
                    .tabItem {
                        // System Dock uses the tabItem’s label and icon
                        Image(systemName: tab.icon)
                        Text(tab.rawValue)
                    }
                }
            }
        }
        // Keep keyboard safe-area behavior if you like
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    TabsScreen(tabRouter: TabRouter())
}
