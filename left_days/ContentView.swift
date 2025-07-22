//
//  ContentView.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var goals: [Goal] = []
    var body: some View {
        NavigationSplitView {
            if goals.isEmpty {
                ContentUnavailableView(label: {
                    Label("目標がまだありません", systemImage: "magnifyingglass")
                }, description: {
                    Text("右上の「＋」ボタンから目標を追加しましょう。")
                })
            } else {
                List {
                    ForEach(goals) { goal in
                        LeftDaysCell()
                    }
                }
            }
        } detail: {
            Text("Detail View")
        }
    }
}

#Preview {
    ContentView()
}
