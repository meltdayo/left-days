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
    @State var isBirthDateSet: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                if !isBirthDateSet {
                    ProfileView()
                } else {
                    if goals.isEmpty {
                        ContentUnavailableView(label: {
                            Label("目標がまだありません", systemImage: "magnifyingglass")
                        }, description: {
                            Text("右上の「＋」ボタンから目標を追加しましょう。")
                        })
                    } else {
                        List {
                            ForEach(goals) { goal in
                                NavigationLink {
                                    LeftDaysCell()
                                } label: {
                                    LeftDaysCell()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(isBirthDateSet ? "あと何日" :"")
            .toolbar {
                if isBirthDateSet {
                    ToolbarItem(placement: .automatic){
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
