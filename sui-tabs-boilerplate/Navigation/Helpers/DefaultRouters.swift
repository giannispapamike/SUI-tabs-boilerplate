//
//  DefaultRouters.swift
//  sui-tabs-boilerplate
//
//  Created by Ioannis Papamichail on 22/6/24.
//

import SwiftUI

/* 
 * MARK: Suggestion
 * You should replace this with your own dependency injection system
 * And decide when you would want to share a router instance globally, between
 * specific views or even use unique instances on specific cases
 * Your only limitation is YOUR imagination <3
 */
@MainActor
class DefaultRouters {
    static var tabRouter = TabRouter()
    static var homeRouter = Router()
    static var groupsRouter = Router()
    static var profileRouter = Router()
    static var settingsRouter = Router()
}
