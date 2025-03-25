import Foundation
import SwiftUI

public protocol CoordinatorDisplay: ObservableObject {
    var path: [IdentifiableAnyView] { get set }
    var sheet: IdentifiableAnyView? { get set }
    var fullScreenCover: IdentifiableAnyView? { get set }
}

public protocol CoordinatorNavigation {
    func push(_ screen: IdentifiableAnyView)
    func presentSheet(_ sheet: IdentifiableAnyView)
    func presentFullScreenCover(_ fullScreenCover: IdentifiableAnyView)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

public typealias Coordinator = CoordinatorNavigation & CoordinatorDisplay
