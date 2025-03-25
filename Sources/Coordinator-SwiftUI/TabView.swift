//
//  SwiftUIView.swift
//  Coordinator
//
//  Created by Georges Khoury on 30/01/2025.
//

import SwiftUI

public struct TabedView: View {
    let tabs: [IdentifiableAnyView]
    @State private(set) var selectedTab: IdentifiableAnyView
    
    public init(tabs: [IdentifiableAnyView]) {
        self.tabs = tabs
        self.selectedTab = tabs.first!
    }
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs.indices, id: \.self) { index in
                tabs[index].view
                    .tabItem {
                        Label("\(index)", systemImage: "circle")
                    }
                    .tag(index)
            }
        }
    }
}

#Preview {
    TabedView(
        tabs: [
            IdentifiableAnyView(view: ProgressView())
        ]
    )
}
