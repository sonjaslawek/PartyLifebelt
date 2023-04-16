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
        let GamesViewController = GamesViewController.instantiate()
        GamesViewController.coordinator = self
        navigationController.pushViewController(GamesViewController, animated: true)
    }
   
    
    func drinksView() {
        let DrinksViewController = DrinksViewController.instantiate()
        DrinksViewController.coordinator = self
        navigationController.pushViewController(DrinksViewController, animated: true)
    }
    
    func foodView() {
        let fc = FoodViewController.instantiate()
        fc.coordinator = self
        navigationController.pushViewController(fc, animated: true)
    }
    
    func truthOrDareGameView() {
        let TruthOrDareGameViewController = TruthOrDareGameViewController.instantiate()
        TruthOrDareGameViewController.coordinator = self
        navigationController.pushViewController(TruthOrDareGameViewController, animated: true)
    }
    
    func neverHaveIEverGameView() {
        let NeverHaveIEverGameViewController = NeverHaveIEverGameViewController.instantiate()
        NeverHaveIEverGameViewController.coordinator = self
        navigationController.pushViewController(NeverHaveIEverGameViewController, animated: true)
    }
    
    func thisOrThatGameView() {
        let ThisOrThatGameViewController = ThisOrThatGameViewController.instantiate()
        ThisOrThatGameViewController.coordinator = self
        navigationController.pushViewController(ThisOrThatGameViewController, animated: true)
    }
    
    func sevenSecondsGameView() {
        let SevenSecondsGameViewController = SevenSecondsGameViewController.instantiate()
        SevenSecondsGameViewController.coordinator = self
        navigationController.pushViewController(SevenSecondsGameViewController, animated: true)
    }
    
    func detailDrinksView(model:DrinkModel) {
        let DetailDrinksViewController = DetailDrinksViewController.instantiate()
        DetailDrinksViewController.coordinator = self
        DetailDrinksViewController.drink = model
        navigationController.pushViewController(DetailDrinksViewController, animated: true)
    }
    
    func detailFoodView() {
        let df = DetailFoodViewController.instantiate()
        df.coordinator = self
        navigationController.pushViewController(df, animated: true)
    }

}
