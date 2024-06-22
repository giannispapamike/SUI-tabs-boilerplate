//
//  CommonView.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

struct CommonView: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text("Common View")
            Text("Nested Level: \(self.router.path.count)")
            NavigationHelperView()
                .environment(self.router)
        }
    }
}

#Preview {
    CommonView()
        .environment(Router())
}
