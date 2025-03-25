//
//  IdentifiableAnyView.swift
//  Coordinator
//
//  Created by Georges Khoury on 30/01/2025.
//

import Foundation
import SwiftUICore

@available(iOS 16.0, *)
public struct IdentifiableAnyView: Identifiable, Hashable {
    public let id: UUID
    let view: AnyView
    
    public init<V: View>(id: UUID = UUID(), view: V) {
        self.id = id
        self.view = AnyView(view)
    }
    
    // Conformance to Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Conformance to Equatable (required for Hashable)
    public static func == (lhs: IdentifiableAnyView, rhs: IdentifiableAnyView) -> Bool {
        lhs.id == rhs.id
    }
}
