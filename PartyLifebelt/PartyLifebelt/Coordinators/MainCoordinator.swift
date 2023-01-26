//
//  MainCoordinator.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DashboardViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func gamesView() {
        let gc = GamesViewController.instantiate()
        gc.coordinator = self
        navigationController.pushViewController(gc, animated: true)
    }
   
    
    func drinksView() {
        let dc = DrinksViewController.instantiate()
        dc.coordinator = self
        navigationController.pushViewController(dc, animated: true)
    }
    
    func foodView() {
        let fc = FoodViewController.instantiate()
        fc.coordinator = self
        navigationController.pushViewController(fc, animated: true)
    }
}
