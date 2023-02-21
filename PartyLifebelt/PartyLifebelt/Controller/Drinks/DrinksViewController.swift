//
//  DrinksViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class DrinksViewController: UIViewController, Storyboarded  {
    
    @IBOutlet weak var drinksTableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    var drink = DrinksDataClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinksTableView.delegate = self
        drinksTableView.dataSource = self
        setNavigationBarImage()
        drink.getData {
            DispatchQueue.main.async {
                self.drinksTableView.reloadData()
            }
        }
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
extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.drinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = drinksTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == drink.drinkArray.count - 1 && drink.letterIndex < drink.letters.count {
            drink.getData {
                DispatchQueue.main.async {
                    self.drinksTableView.reloadData()
                }
            }
        }
        cell.textLabel?.text = drink.drinkArray[indexPath.row].strDrink
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRow = drinksTableView.indexPathForSelectedRow else { return }
        coordinator?.detailDrinksView(model: drink.drinkArray[selectedRow.row])
    }
}
