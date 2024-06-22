//
//  Routes.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

enum Routes: RoutesProtocol {
    case exampleView
    case exampleViewWithData(text: String)
    case common(Routes.Common)

    @MainActor 
    @ViewBuilder func view() -> some View {
        switch self {
            case .exampleView:
                ExampleView()
            case let .exampleViewWithData(text):
                ExampleViewWithData(text: text)
            case let .common(view):
                view.view()
        }
    }

}

