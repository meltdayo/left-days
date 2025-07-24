//
//  ProfileView.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/24.
//

import SwiftUI

struct ProfileView: View {
    @State var birthDate: Date = Date()
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Profile")) {
                    DatePicker("生年月日", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.wheel)
                }
            }
            .navigationTitle("年齢設定")
        }
        .onAppear() {
            
        }
    }
}

#Preview {
    ProfileView()
}
