//
//  Router.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

@MainActor
protocol RouterProtocol {
    associatedtype T: RoutesProtocol
    associatedtype V: View
    var path: [T] { get }
    func navigate(to route: T)
    func back()
    func back(by step: Int)
    func root()
    func createRouterPathBinding() -> Binding<[T]>
    @ViewBuilder func navigationHandler(_ value: T) -> V
}

@MainActor
@Observable 
final class Router: RouterProtocol {
    typealias T = Routes
    private(set) var path = [T]() {
        didSet {
            print("[ROUTER]:[PATH]:[DIDSET]:", self.path)
        }
    }
    var type: T?

    init() {}

    func navigate(to route: T) {
        self.path.append(route)
    }

    func back() {
        assert(
            self.path.count > 0,
            "[ROUTER]:[BACK]:[ASSERT]: View stack does not include sufficient views for this action"
        )
        guard self.path.count > 0 else { return }
        self.path.removeLast()
    }

    func back(by step: Int) {
        assert(
            self.path.count > 0,
            "[ROUTER]:[BACK]:[ASSERT]: View stack does not include sufficient views for this action"
        )
        guard path.count >= step else { return }
        self.path.removeLast(step)
    }

    // TODO: Navigate back to latest instance of T (route)

    func root() {
        guard self.path.count > 0 else { return }
        self.path.removeLast(self.path.count)
    }

    func createRouterPathBinding() -> Binding<[T]> {
        Binding<[T]>(
            get: { self.path },
            set: { value in self.path = value }
        )
    }

    @ViewBuilder func navigationHandler(_ value: T) -> some View {
        value.view()
            .environment(self)
    }
}
