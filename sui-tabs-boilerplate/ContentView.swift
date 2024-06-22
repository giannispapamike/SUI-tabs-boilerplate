//
//  ContentView.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabsScreen(tabRouter: DefaultRouters.tabRouter)
    }
}

#Preview {
    ContentView()
}
