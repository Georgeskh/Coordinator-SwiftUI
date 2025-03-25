//
//  CoordinatorView.swift
//  Coordinator
//
//  Created by Georges Khoury on 30/01/2025.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public struct CoordinatorView<Content: View, Navigation: Coordinator>: View {
    @StateObject private var navigation: Navigation
    let mainView: Content
    
    public init(coordinator: Navigation = AppCoordinator(), @ViewBuilder mainView: (any CoordinatorNavigation) -> Content) {
        self._navigation = StateObject(wrappedValue: coordinator)
        self.mainView = mainView(coordinator)
    }
    
    public var body: some View {
        NavigationStack(path: $navigation.path) {
            mainView
                .navigationDestination(for: IdentifiableAnyView.self) { screen in
                    screen.view
                }
                .sheet(item: $navigation.sheet) { sheet in
                    sheet.view
                }
                .fullScreenCover(item: $navigation.fullScreenCover) { fullScreenCover in
                    fullScreenCover.view
                }
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    CoordinatorView(coordinator: AppCoordinator(path: [])) {_ in
        EmptyView()
    }
}
