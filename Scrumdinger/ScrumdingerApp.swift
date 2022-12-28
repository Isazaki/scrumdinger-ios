//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kondwani Msiska on 27/12/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
