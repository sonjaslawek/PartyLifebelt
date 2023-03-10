//
//  FoodViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class FoodViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var foodTabBar: UITabBar!
    weak var coordinator: MainCoordinator?
    var foodTab = FoodTabBarController()
    var foodAPI = FoodData()
    var foodModel: [FoodModel] = []
    var testCell = ["jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy"]

    override func viewDidLoad() {
        super.viewDidLoad()
        foodTableView.delegate = self
        foodTableView.dataSource = self
        setNavigationBarImage()
        foodTabBar.delegate = self
        foodTabBar.barTintColor = .clear
        //foodAPI.getFoodData()
        self.foodTab.setTabBar()
        
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
}
// MARK: TableView Delegate Methods
extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        cell.textLabel?.text = testCell[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedRow = foodTableView.indexPathForSelectedRow else { return }
        coordinator?.detailFoodView()
    }
}
//MARK: TabBarController Delegate Methods
extension FoodViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let allTab = AllFoodViewController()
        let vegeTab = VegeViewController()
        let dessertTab = DessertViewController()
        let randomTab = RandomViewController()

        let allNav = UINavigationController(rootViewController: allTab)
        let vegeNav = UINavigationController(rootViewController: vegeTab)
        let dessertNav = UINavigationController(rootViewController: dessertTab)
        let randomNav = UINavigationController(rootViewController: randomTab)
       
       allNav.tabBarItem = UITabBarItem(title: "ALL", image: UIImage(systemName: "book"), tag: 1)
       vegeNav.tabBarItem = UITabBarItem(title: "VEGE", image: UIImage(systemName: "leaf"), tag: 2)
       dessertNav.tabBarItem = UITabBarItem(title: "DESSERT", image: UIImage(systemName: "cup.and.saucer"), tag: 3)
       randomNav.tabBarItem = UITabBarItem(title: "RANDOM", image: UIImage(systemName: "infinity"), tag: 4)
        
    }
    
}
