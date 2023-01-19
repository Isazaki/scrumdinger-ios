//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kondwani Msiska on 27/12/2022.
//

import SwiftUI


@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")                        }
                    }
                }
                .sheet(item: $errorWrapper, onDismiss: {
                    store.scrums = DailyScrum.sampleData
                    
                }) { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
                .task {
                    do {
                        store.scrums = try await ScrumStore.load()
                    } catch {
                        fatalError("Error loading scrums")
                    }
                }
            }
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
