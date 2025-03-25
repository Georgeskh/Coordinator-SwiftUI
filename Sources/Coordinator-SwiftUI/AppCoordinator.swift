//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Georges Khoury on 30/01/2025.
//

import Foundation
import SwiftUI

public final class AppCoordinator: Coordinator {
    @Published public var path: [IdentifiableAnyView]
    @Published public var sheet: IdentifiableAnyView?
    @Published public var fullScreenCover: IdentifiableAnyView?
    
    public init(path: [IdentifiableAnyView] = [], sheet: IdentifiableAnyView? = nil, fullScreenCover: IdentifiableAnyView? = nil) {
        self.path = path
        self.sheet = sheet
        self.fullScreenCover = fullScreenCover
    }
    
    // MARK: - Navigation Functions
    public func push(_ screen: IdentifiableAnyView) {
        path.append(screen)
    }
    
    public func presentSheet(_ sheet: IdentifiableAnyView) {
        self.sheet = sheet
    }
    
    public func presentFullScreenCover(_ fullScreenCover: IdentifiableAnyView) {
        self.fullScreenCover = fullScreenCover
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func dismissSheet() {
        self.sheet = nil
    }
    
    public func dismissFullScreenOver() {
        self.fullScreenCover = nil
    }
}
