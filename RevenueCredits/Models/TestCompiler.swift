//
//  TestCompiler.swift
//  RevenueCredits
//
//  Created by Matteo Radice on 20/06/21.
//

import Foundation

struct TestCompiler {
        
    init() {
        let project1: Project = Project(clientName: "Client 1", projectTitle: "Project 1", clientPrice: 100, expensesRatio: 0.1, revenueCreditShare: 30, comments: "This is the first project for client 1", probability: 1)
        let project2: Project = Project(clientName: "Client 1", projectTitle: "Project 2", clientPrice: 100, expensesRatio: 0.1, revenueCreditShare: 30, comments: "This is the second project for client 1", probability: 0.5)
        let project3: Project = Project(clientName: "Client 2", projectTitle: "Project 1", clientPrice: 100, expensesRatio: 0.1, revenueCreditShare: 30, comments: "This is the first project for client 2", probability: 0)
        AllProjects.shared.projectsArray.append(project1)
        AllProjects.shared.projectsArray.append(project2)
        AllProjects.shared.projectsArray.append(project3)
    }
        
}
