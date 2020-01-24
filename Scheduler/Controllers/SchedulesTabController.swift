//
//  SchedulesTabController.swift
//  Scheduler
//
//  Created by Oscar Victoria Gonzalez  on 1/24/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SchedulesTabController: UITabBarController {
    
    private let dataPersistance = DataPersistence<Event>(filename: "schedules.plist")
    
    // get instances of the two tabs fromt he storyboard
    
    private lazy var scheduleNavController: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "SchedulesNavController") as? UINavigationController,
            let schedulesListController = navController.viewControllers.first as? ScheduleListController else {
                fatalError("could not load nav controller")
        }
        // set dataPersistance property
        schedulesListController.dataPersistance = dataPersistance
        return navController
    }()
    
    
    private lazy var completedNavContraller: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "CompletedNavController") as? UINavigationController,
            let completedController = navController.viewControllers.first as? CompletedScheduleController else {
                fatalError("error")
        }
        completedController.dataPersistance = dataPersistance
        return navController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [scheduleNavController, completedNavContraller]
        
    }
    
    
}
