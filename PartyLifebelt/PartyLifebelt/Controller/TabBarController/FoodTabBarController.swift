//
//  FoodTabViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 10/03/2023.
//

import UIKit

class FoodTabBarController: UITabBarController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var foodAPI = FoodData()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.backgroundColor = .green
        setTabBar()
        setNavigationBarImage()
       // foodAPI.getFoodData()
    }
    
    // MARK: Setting Navigation Bar
    private func setNavigationBarImage() {
        let backButton = UIBarButtonItem(image: UIImage(named: "homeButton"), style: .plain, target: self, action: #selector(goTo))
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -70, bottom: 0, right: 0)
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goTo() {
        coordinator?.start()
    }

   func setTabBar() {
        let allTab = FoodViewController()
        let vegeTab = FoodViewController()
        let dessertTab = FoodViewController()
        let randomTab = FoodViewController()

       allTab.navigationItem.largeTitleDisplayMode = .always
        let allNav = UINavigationController(rootViewController: allTab)
        let vegeNav = UINavigationController(rootViewController: vegeTab)
        let dessertNav = UINavigationController(rootViewController: dessertTab)
        let randomNav = UINavigationController(rootViewController: randomTab)
       
       allNav.tabBarItem = UITabBarItem(title: "ALL", image: UIImage(systemName: "book"), tag: 1)
       vegeNav.tabBarItem = UITabBarItem(title: "VEGE", image: UIImage(systemName: "leaf"), tag: 2)
       dessertNav.tabBarItem = UITabBarItem(title: "DESSERT", image: UIImage(systemName: "cup.and.saucer"), tag: 3)
       randomNav.tabBarItem = UITabBarItem(title: "RANDOM", image: UIImage(systemName: "infinity"), tag: 4)
       
        setViewControllers([allNav, vegeNav, dessertNav, randomNav], animated: true)
    }

}
