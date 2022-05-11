//
//  SheetsExampleApp.swift
//  SheetsExample
//
//  Created by Russell Gordon on 2022-05-11.
//

import SwiftUI

@main
struct SheetsExampleApp: App {
    
    // MARK: Stored properties
    
    // The source of truth for the list of teams
    // In a completed app (for the culminating) this list would be populated from one of:
    // 1. A JSON file in the app bundle
    // 2. A JSON file received from a remote endpoint over the web
    // 3. Direct user input while running the app
//    @State var teams: [Team] = []
    @State var teams: [Team] = exampleTeams     // For the purposes of this demo,
                                                // the "teams" list is instead
                                                // populated with a list of examples

    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            // Pass the source of truth down to the next view
            TeamListView(teams: $teams)
        }
    }
}
