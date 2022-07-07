//
//  Activities.swift
//  HabitTracker
//
//  Created by Vanüsha on 02.07.2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let encoded = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: encoded) {
                activities = decoded
                return
            }
        }
        
        activities = []
    }
}
