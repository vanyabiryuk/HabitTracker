//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Vanüsha on 07.07.2022.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    @State var activity: Activity
    
    var body: some View {
        Form {
            Text(activity.description)
            Stepper("\(activity.repetitions) times", value: $activity.repetitions, in: 0...1000)
        }
        .navigationTitle(activity.title)
        .toolbar {
            Button("Save") {
                for (i, _) in activities.activities.enumerated() {
                    if activities.activities[i].id == activity.id {
                        activities.activities[i].repetitions = activity.repetitions
                        break
                    }
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activities: Activities(), activity: Activity(title: "", description: ""))
    }
}
