//
//  AddTeamView.swift
//  SheetsExample
//
//  Created by Russell Gordon on 2022-05-11.
//

import SwiftUI

/// - Tag: se_addteamview
struct AddTeamView: View {
    
    // MARK: Stored properties
    
    // The main list of teams
    // A derived value; this is connected to the
    // source of truth on SheetsExampleApp, via
    // TeamListView
    @Binding var teams: [Team]

    // A derived value; this is connected to the source of truth on TeamListView
    @Binding var isAddTeamViewShowing: Bool
    
    // The name of the new team
    @State var newTeamName = ""
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 10) {
                TextField("Enter team name", text: $newTeamName)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Add Team")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button(action: {
                        
                        // Hide the view by setting the boolean back to false
                        isAddTeamViewShowing = false
                        
                        // Get an id that is one greater than the current maximum number of teams
                        let newId = teams.count + 1
                        
                        // Create the new Team structure instance
                        let newTeam = Team(id: newId, name: newTeamName)
                        
                        // Add to the list of teams
                        teams.append(newTeam)
                        
                    }, label: {
                        
                        Text("Done")
                        
                    })
                    
                }
            }
            
        }
        
    }
}

struct AddTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamView(teams: .constant(exampleTeams),
                    isAddTeamViewShowing: .constant(true))
    }
}
