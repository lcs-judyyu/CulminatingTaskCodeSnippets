//
//  TeamListView.swift
//  SheetsExample
//
//  Created by Russell Gordon on 2022-05-11.
//

import SwiftUI

struct TeamListView: View {
    
    // MARK: Stored properties
    
    // The main list of teams
    // A derived value; this is connected to the
    // source of truth on SheetsExampleApp, which
    // is the app entry point
    @Binding var teams: [Team]

    // Should the add team interface be shown?
    // The source of truth (value is created and stored here)
    /// - Tag: se_boolean
    @State var isAddTeamViewShowing = false
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            List(teams) { currentTeam in
                Text(currentTeam.name)
            }
            .navigationTitle("Teams")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    Button(action: {
                        
                        // Show the add team view by setting the boolean to true
                        isAddTeamViewShowing = true
                        
                    }, label: {
                        
                        Text("Add New Team")
                        
                    })
                    
                }
            }
            // When "isAddTeamViewShowing" is true, the sheet is presented
            .sheet(isPresented: $isAddTeamViewShowing) {
                AddTeamView(teams: $teams,
                            isAddTeamViewShowing: $isAddTeamViewShowing)
            }

        }
        
    }
    
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView(teams: .constant(exampleTeams))
    }
}
