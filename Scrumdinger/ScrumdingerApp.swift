//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kondwani Msiska on 27/12/2022.
//

import SwiftUI


@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
