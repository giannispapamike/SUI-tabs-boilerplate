//
//  Routes.protocol.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

protocol RoutesProtocol: Hashable, Equatable {
    associatedtype V: View
    @ViewBuilder func view() -> V
}
