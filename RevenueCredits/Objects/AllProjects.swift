//
//  AllProjects.swift
//  RevenueCredits
//
//  Created by Matteo Radice on 20/06/21.
//

import Foundation
import UIKit

class AllProjects {
    
    // Singleton
    static var shared = AllProjects()
    
    // Attributes
    var projectsArray: [Project]
    
    // Initialization of the attributes
    init() {
        self.projectsArray = CoreDataManager.shared.loadAllProjects()
    }
}
