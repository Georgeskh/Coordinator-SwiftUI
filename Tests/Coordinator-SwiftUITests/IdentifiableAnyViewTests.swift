import Testing
import SwiftUICore
@testable import Coordinator_SwiftUI

struct IdentifiableAnyViewTests {
    @available(iOS 16.0, *)
    @Test func testIDUniqueness() {
        let view1 = IdentifiableAnyView(view: Text("View 1"))
        let view2 = IdentifiableAnyView(view: Text("View 2"))
        #expect(view1.id != view2.id, "IDs should be unique")
    }
    
    @available(iOS 16.0, *)
    @Test func testIDPersistence() {
        let view = IdentifiableAnyView(view: Text("Test View"))
        let id = view.id
        #expect(view.id == id, "ID should remain the same")
    }
    
    @available(iOS 16.0, *)
    @Test func testHashableConformance() {
        let view1 = IdentifiableAnyView(view: Text("View 1"))
        let view2 = IdentifiableAnyView(view: Text("View 2"))
        var set = Set<IdentifiableAnyView>()
        set.insert(view1)
        set.insert(view2)
        #expect(set.count == 2, "Hashable conformance should allow storing in a Set")
    }
    
    @available(iOS 16.0, *)
    @Test func testEquatableConformance() {
        let view1 = IdentifiableAnyView(id: UUID(), view: Text("View 1"))
        let view2 = IdentifiableAnyView(id: view1.id, view: Text("View 2")) // Same ID, different view
        #expect(view1 == view2, "Views with the same ID should be equal")
    }
}
