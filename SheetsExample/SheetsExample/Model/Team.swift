//
//  Team.swift
//  SheetsExample
//
//  Created by Russell Gordon on 2022-05-11.
//

import Foundation

struct Team: Identifiable {
    
    let id: Int     // Must be unique for each instance of the Team structure
    let name: String
    
}

let exampleTeam = Team(id: 1, name: "Liverpool")

let exampleTeams = [
    
    Team(id: 1, name: "Liverpool")
    
    ,
    
    Team(id: 2, name: "Manchester City")
    
    ,

    Team(id: 3, name: "Chelsea")
    
    ,
    
]
