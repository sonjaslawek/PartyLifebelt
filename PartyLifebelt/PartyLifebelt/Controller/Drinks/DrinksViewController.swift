//
//  DrinksViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class DrinksViewController: UIViewController, Storyboarded  {
    
    @IBOutlet weak var drinksTableView: UITableView!
    @IBOutlet weak var drinkSearchBar: UISearchBar!
    
    weak var coordinator: MainCoordinator?
    var drinkAPI = DrinkData()
    var drinkModel: [DrinkModel] = []
    var searchBarItems: [DrinkModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinksTableView.delegate = self
        drinksTableView.dataSource = self
        drinkSearchBar.delegate = self
        setNavigationBarImage()
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        loadDrinks()
        drinksTableView.tableHeaderView = drinkSearchBar
    }
    
    @IBAction func alcoholOptionsSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarItems = drinkModel.sorted(by: {$0.strDrink < $1.strDrink})
            drinksTableView.reloadData()
        case 1:
            searchBarItems = drinkModel.filter {$0.strAlcoholic == "Alcoholic"}
            searchBarItems = searchBarItems.sorted(by: {$0.strDrink < $1.strDrink})
            drinksTableView.reloadData()
        case 2:
            searchBarItems = drinkModel.filter {$0.strAlcoholic == "Non alcoholic"}
            searchBarItems = searchBarItems.sorted(by: {$0.strDrink < $1.strDrink})
            drinksTableView.reloadData()
        default:
            print("Somethings gone wrong with segments!")
        }
    }
    @IBAction func randomDrinkButton(_ sender: Any) {
        guard let randomDrink = searchBarItems.randomElement() else { return }
        coordinator?.detailDrinksView(model: randomDrink)
        print("Random drink will be present")
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
    
    func loadDrinks() {
        drinkAPI.getAllData {
            DispatchQueue.main.async {
               self.drinkModel = self.drinkAPI.drinkArray
                self.searchBarItems = self.drinkModel//.sorted(by: {$0.strDrink < $1.strDrink})
                self.drinksTableView.reloadData()
            }
        }
    }
}

// MARK: TableView Delegate Methods
extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchBarItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 60
        let cell = drinksTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = searchBarItems[indexPath.row].strDrink
        cell.textLabel?.textColor = .white
        guard let url = URL(string: searchBarItems[indexPath.row].strDrinkThumb ?? "" ) else {return cell}
        do {
            let data = try Data(contentsOf: url)
            cell.imageView?.image = UIImage(data: data)
        } catch {
            print("ERROR! rouble with image url in cell properties \(url)")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedRow = drinksTableView.indexPathForSelectedRow else { return }
        coordinator?.detailDrinksView(model: searchBarItems[selectedRow.row])
    }
}
//MARK: Search Bar Controller Methods
extension DrinksViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterContentForSearchText(searchText)
            drinksTableView.reloadData()
        } else {
            self.searchBarItems = drinkModel
            drinksTableView.reloadData()
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        searchBarItems = drinkModel.filter { drink in
            let drinkTitleMatches = drink.strDrink.range(of: searchText, options: .caseInsensitive) != nil
            let ingredientMatches = [
                drink.strIngredient1,
                drink.strIngredient2,
                drink.strIngredient3,
                drink.strIngredient4,
                drink.strIngredient5,
                drink.strIngredient6,
                drink.strIngredient7,
                drink.strIngredient8,
                drink.strIngredient9,
                drink.strIngredient10,
                drink.strIngredient11,
                drink.strIngredient12,
                drink.strIngredient13,
                drink.strIngredient14,
                drink.strIngredient15
            ].compactMap { $0 }
                .contains { ingredient in
                    ingredient.range(of: searchText, options: .caseInsensitive) != nil
                }
            return drinkTitleMatches || ingredientMatches
        }
        
        if drinkModel.count == 0 {
            loadDrinks()
        }
    }
}

