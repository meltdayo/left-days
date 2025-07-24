//
//  AddView.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/22.
//

import SwiftUI

struct AddView: View {
    @State private var age: Int = 30
    @State private var targetDate = Date()
    @State private var title: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タイトル")){
                    TextField("どんな期限？", text: $title)
                }
                Section(header: Text("何歳までに")) {
                    Stepper(value: $age, in: 0...100) {
                        Text("\(age) 歳")
                    }
                }
                Section(header: Text("いつまでに")) {
                    DatePicker("期限を選択", selection: $targetDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section {
                    Button("作成") {
                        // 今回はまだロジックなし
                    }
                }
            }
            .navigationTitle("目標の追加")
        }
    }
}

#Preview {
    AddView()
}
