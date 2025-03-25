import Foundation
import SwiftUI

@available(iOS 16.0, *)
public protocol CoordinatorDisplay: ObservableObject {
    var path: [IdentifiableAnyView] { get set }
    var sheet: IdentifiableAnyView? { get set }
    var fullScreenCover: IdentifiableAnyView? { get set }
}

@available(iOS 16.0, *)
public protocol CoordinatorNavigation {
    func push(_ screen: IdentifiableAnyView)
    func presentSheet(_ sheet: IdentifiableAnyView)
    func presentFullScreenCover(_ fullScreenCover: IdentifiableAnyView)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

@available(iOS 16.0, *)
public typealias Coordinator = CoordinatorNavigation & CoordinatorDisplay
