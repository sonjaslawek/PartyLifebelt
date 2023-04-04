//
//  FoodViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class FoodViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var foodTableView: UITableView!
    weak var coordinator: MainCoordinator?
    var foodAPI = FoodData()
    var foodModel: [FoodModel] = []
    var testCell = ["jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        foodTableView.delegate = self
        foodTableView.dataSource = self
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
