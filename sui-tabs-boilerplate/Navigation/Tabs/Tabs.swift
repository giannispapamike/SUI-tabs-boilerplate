//
//  Tabs.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

enum Tab: String, TabProtocol {
    case home = "Home"
    case groups = "Groups"
    case profile = "Profile"
    case settings = "Settings"

    // Conform to Identifiable protocol using self for id,
    // as simple enum cases conform to hashable protocol
    var id: Self { return self }

    /*
     * TODO: Store enabled tabs in persistent storage so the user can enable/disable tabs from settings
     */
    var isEnabled: Bool {
        // Option to enable specific tabs until new screen is ready
        // Alter this array and see it in action
        let enabledTabs: [Self] = [.home, .groups, .profile, .settings]

        return enabledTabs.contains(self)
    }

    var icon: String {
        switch self {
            case .home: "house.fill"
            case .groups: "person.2.fill"
            case .profile: "person.crop.circle"
            case .settings: "gearshape.fill"
        }
    }

    @MainActor
    var router: Router {
        switch self {
            case .home: DefaultRouters.homeRouter
            case .groups: DefaultRouters.groupsRouter
            case .profile: DefaultRouters.profileRouter
            case .settings: DefaultRouters.settingsRouter
        }
    }

    @MainActor @ViewBuilder var view: some View {
        switch self {
            case .home: Routes.exampleView.view()
            case .groups: Routes.exampleViewWithData(text: "GROUPS").view()
            case .profile: Routes.exampleViewWithData(text: "PROFILE").view()
            case .settings: Routes.common(.exampleCommonView).view()
        }
    }
}
