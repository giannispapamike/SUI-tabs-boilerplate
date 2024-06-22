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
        ZStack(alignment: .bottom) {
            TabView(selection: tabRouter.createTabViewBinding()) {
                ForEach(Tab.allCases) { tab in
                    if tab.isEnabled {
                        NavigationStack(path: tab.router.createRouterPathBinding()) {
                            tab.view
                                .environment(tab.router)
                                .navigationDestination(for: Routes.self, destination: tab.router.navigationHandler)
                                .navigationTitle(tab.rawValue.capitalized)
                        }
                        .tag(tab)
                    }
                }
            }

            createTabBar()
        }
        .ignoresSafeArea(.keyboard)
    }
}

extension TabsScreen {
    @MainActor
    @ViewBuilder private func createTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases) { tab in
                if tab.isEnabled {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 24))
                            .symbolVariant(.fill)
                            .symbolEffect(.bounce.down.byLayer, options: .speed(2), value: tabRouter.animateSymbol[tab])

                        Text(tab.rawValue)
                            .font(.caption)
                            .textScale(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(tabRouter.activeTab == tab ? .blue : .gray)
                    .padding(.top, 10)
                    .padding(.bottom, 0)
                    .contentShape(.rect)
                    .onTapGesture {
                        tabRouter.navigate(to: tab)
                    }
                }
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    TabsScreen(tabRouter: TabRouter())
}
