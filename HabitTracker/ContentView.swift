//
//  ContentView.swift
//  HabitTracker
//
//  Created by Vanüsha on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities) { activity in
                    NavigationLink {
                        ActivityView(activities: activities, activity: activity)
                    } label: {
                        Text(activity.title)
                    }
                }
                .onDelete(perform: removeActivity)
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.primary)
                }
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddActivity(activities: activities)
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
