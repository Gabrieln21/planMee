//
//  ContentView.swift
//  planMee
//

import SwiftUI

struct ContentView: View {
    @StateObject var todayPlanManager = TodayPlanManager()
    @StateObject var groupManager = TaskGroupManager()

    init() {
        // 🔥 Configure your OpenAI API key here when ContentView loads
        PlannerService.shared.configure(apiKey: "***REMOVED***")
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Today", systemImage: "calendar")
                }
                .environmentObject(groupManager)
                .environmentObject(todayPlanManager)

            TopicsView()
                .tabItem {
                    Label("Topics", systemImage: "list.bullet.rectangle.portrait")
                }
                .environmentObject(groupManager)
                .environmentObject(todayPlanManager) // ✅ you forgot this earlier!
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(TaskGroupManager())  // ✅ ADD these for Preview
        .environmentObject(TodayPlanManager())
}
