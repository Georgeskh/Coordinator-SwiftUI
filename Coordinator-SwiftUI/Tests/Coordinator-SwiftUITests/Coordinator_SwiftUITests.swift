import Testing
@testable import Coordinator_SwiftUI

struct CoordinatorTests {
    @available(iOS 16.0, *)
    @Test("Pushes a view and verifies that the path array is updated correctly.")
    func testPush() {
        let coordinator = AppCoordinator()
        let view = IdentifiableAnyView(view: TestView(count: 1))
        coordinator.push(view)
        #expect(coordinator.path.count == 1)
        #expect(coordinator.path.first == view)
    }
    
    @available(iOS 16.0, *)
    @Test("Presents a sheet and checks if the sheet property is set.")
    func testPresentSheet() {
        let coordinator = AppCoordinator()
        let sheetView = IdentifiableAnyView(view: TestView(count: 1))
        coordinator.presentSheet(sheetView)
        #expect(coordinator.sheet == sheetView)
    }
    
    @available(iOS 16.0, *)
    // Presents a full screen cover and checks if the fullScreenCover property is set.
    @Test func testPresentFullScreenCover() {
        let coordinator = AppCoordinator()
        let fullScreenCoverView = IdentifiableAnyView(view: TestView(count: 1))
        coordinator.presentFullScreenCover(fullScreenCoverView)
        #expect(coordinator.fullScreenCover == fullScreenCoverView)
    }
    
    @available(iOS 16.0, *)
    // Pushes two views, pops one, and verifies the path array.
    @Test func testPop() {
        let coordinator = AppCoordinator()
        let view1 = IdentifiableAnyView(view: TestView(count: 1))
        let view2 = IdentifiableAnyView(view: TestView(count: 2))
        coordinator.push(view1)
        coordinator.push(view2)
        coordinator.pop()
        #expect(coordinator.path.count == 1)
        #expect(coordinator.path.first == view1)
    }
    
    @available(iOS 16.0, *)
    // Pushes views and then pops to root, ensuring the path is empty.
    @Test func testPopToRoot() {
        let coordinator = AppCoordinator()
        coordinator.push(IdentifiableAnyView(view: TestView(count: 1)))
        coordinator.push(IdentifiableAnyView(view: TestView(count: 2)))
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @available(iOS 16.0, *)
    // Presents and dismisses a sheet, checking if the sheet property is nil.
    @Test func testDismissSheet() {
        let coordinator = AppCoordinator()
        coordinator.sheet = IdentifiableAnyView(view: TestView(count: 1))
        coordinator.dismissSheet()
        #expect(coordinator.sheet == nil)
    }
    
    @available(iOS 16.0, *)
    // Presents and dismisses a full screen cover, checking if the fullScreenCover property is nil.
    @Test func testDismissFullScreenCover() {
        let coordinator = AppCoordinator()
        coordinator.fullScreenCover = IdentifiableAnyView(view: TestView(count: 1))
        coordinator.dismissFullScreenOver()
        #expect(coordinator.fullScreenCover == nil)
    }
}
