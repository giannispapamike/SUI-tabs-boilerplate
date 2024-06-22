//
//  CommonRoutes.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

extension Routes {
    enum Common: RoutesProtocol {
        case exampleCommonView

        @MainActor 
        @ViewBuilder func view() -> some View {
            switch self {
                case .exampleCommonView:
                    CommonView()
            }
        }
    }
}
