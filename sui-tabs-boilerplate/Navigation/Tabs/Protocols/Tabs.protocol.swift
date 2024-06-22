//
//  Tabs.protocol.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

protocol TabProtocol: CaseIterable, Identifiable {
    associatedtype V: View

    var id: Self { get }
    var icon: String { get }
    @MainActor var router: Router { get }
    @ViewBuilder var view: V { get }
}
