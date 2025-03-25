//
//  SwiftUIView.swift
//  Coordinator
//
//  Created by Georges Khoury on 30/01/2025.
//

import SwiftUI

public struct TabedView: View {
    let tabs: [IdentifiableAnyView]
    let label: (Int) -> AnyView
    @State private(set) var selectedTab: IdentifiableAnyView
    
    public init(tabs: [IdentifiableAnyView], selectedTab: Int = 0, label: @escaping (Int) -> AnyView) {
        self.tabs = tabs
        self.selectedTab = if tabs.count < selectedTab { tabs.first! } else { tabs[selectedTab] }
        self.label = label
    }
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs.indices, id: \.self) { index in
                tabs[index].view
                    .tabItem {
                        self.label(index)
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
    ) { index in
        AnyView(
            Label("Tab \(index)", systemImage: "star.fill")
                .foregroundColor(index == 0 ? .blue : .gray)
        )
    }
}
