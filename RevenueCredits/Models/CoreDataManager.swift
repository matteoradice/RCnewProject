//
//  CoreDataManager.swift
//  RevenueCredits
//
//  Created by Matteo Radice on 20/06/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private var context: NSManagedObjectContext
    private init() {
        let application = UIApplication.shared.delegate as! AppDelegate
        self.context = application.persistentContainer.viewContext
    }
    
    func loadAllProjects() -> [Project] {
        let request:NSFetchRequest<ProjectDM> = NSFetchRequest(entityName: "ProjectDM")
        request.returnsObjectsAsFaults = false
        let retrievedData = self.loadFromFetchRequest(request: request)
        let projects = convertProjectDMInProject(projectDM: retrievedData)
        return projects
    }
    
    func addProject(project: Project) {
        let item = NSEntityDescription.entity(forEntityName: "ProjectDM", in: self.context)
        let newItem = ProjectDM(entity: item!, insertInto: self.context)
        newItem.clientName = project.clientName
        newItem.clientPrice = project.clientPrice
        newItem.comments = project.comments
        newItem.expensesRatio = project.expensesRatio
        newItem.probability = project.probability
        newItem.projectTitle = project.projectTitle
        newItem.rcMultiplier = project.rcMultiplier
        newItem.revenueCreditShare = project.revenueCreditShare
        do { try self.context.save() }
        catch let error { print(error) }
    }
    
    private func loadFromFetchRequest(request: NSFetchRequest<ProjectDM>) -> [ProjectDM] {
        var array = [ProjectDM]()
        do {
            array = try self.context.fetch(request)
            guard array.count > 0 else {
                print("Database is empty")
                return []
            }
            return array
        }
        catch let error {
            print(error)
        }
        return array
    }
    
    private func convertProjectDMInProject(projectDM: [ProjectDM]) -> [Project] {
        var projects: [Project] = []
        let project: Project = Project(clientName: "", projectTitle: "", clientPrice: 0, expensesRatio: 0, revenueCreditShare: 0, comments: "", probability: 0)
        for i in projectDM {
            project.clientName = i.clientName!
            project.clientPrice = i.clientPrice
            project.comments = i.comments!
            project.expensesRatio = i.expensesRatio
            project.probability = i.probability
            project.projectTitle = i.projectTitle!
            project.rcMultiplier = i.rcMultiplier
            project.revenueCreditShare = i.revenueCreditShare
            projects.append(project)
        }
        return projects
    }
    
}
