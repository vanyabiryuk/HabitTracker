//
//  Activity.swift
//  HabitTracker
//
//  Created by Vanüsha on 02.07.2022.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var repetitions = 0
}
