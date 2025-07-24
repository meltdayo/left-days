//
//  DataManager.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/25.
//

import Foundation
import SwiftData

@MainActor
class DateManager: ObservableObject {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    init() throws {
        let schema = Schema([Goal.self, UserProfile.self])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.modelContext = modelContainer.mainContext
        } catch {
            print("model container error: \(error)")
            throw error
        }
    }
    
    func fetchGoals() throws -> [Goal] {
        do {
            let descriptor = FetchDescriptor<Goal> (
                sortBy: [SortDescriptor(\.priority, order: .reverse),
                         SortDescriptor(\.createdAt, order: .reverse)]
            )
            return try modelContext.fetch(descriptor)
        } catch {
            throw DatamanagerError.failedToDelete("目標の取得に失敗しました: \(error.localizedDescription)")
        }
    }
    
    func fetchGoal(withID id: UUID) throws -> Goal? {
        let predicate = #Predicate<Goal> { $0.id == id }
        let descriptor = FetchDescriptor<Goal>(predicate: predicate)
        do {
            return try modelContext.fetch(descriptor).first
        } catch {
            throw DatamanagerError.failedToFetch("目標の取得に失敗しました: \(error.localizedDescription)")
        }
    }
    
    func saveGoal(_ goal: Goal) throws {
        do {
            modelContext.insert(goal)
            try modelContext.save()
        } catch {
            throw DatamanagerError.failedToSave("目標の保存に失敗しました: \(error.localizedDescription)")
        }
    }
    
    
    
    
    
    enum DatamanagerError: LocalizedError {
        case failedToFetch(String)
        case failedToSave(String)
        case failedToDelete(String)
        case invalidData(String)
        
        var errorDescription: String? {
            switch self {
            case .failedToFetch(let message):
                return "データの取得に失敗しました：\(message)"
            case .failedToSave(let message):
                return "データの保存に失敗しました：\(message)"
            case .failedToDelete(let message):
                return "データの削除に失敗しました：\(message)"
            case .invalidData(let message):
                return "不正なデータ：\(message)"
            }
        }
    }
}
