//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Vanüsha on 07.07.2022.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    if title != "" {
                        let newActivity = Activity(title: title, description: description)
                        activities.activities.append(newActivity)
                    }
                    dismiss()
                }
                .foregroundColor(.primary)
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: Activities())
    }
}
