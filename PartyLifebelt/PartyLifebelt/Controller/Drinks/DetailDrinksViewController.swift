//
//  DetailDrinksViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 21/02/2023.
//

import UIKit

class DetailDrinksViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var drinksTitleLabel: UILabel!
    @IBOutlet weak var drinksImageView: UIImageView!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var recipeTextView: UITextView!
    
    var drink = Drinks()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        guard drink != nil else { return }

        updateDrinksDetails()
    }
    
    func updateDrinksDetails() {
        drinksTitleLabel.text = drink.strDrink
        if drink.strAlcoholic == "Alcoholic" {
            alcoholLabel.text = "YES"
        } else {
            alcoholLabel.text = "NO"
        }
        recipeTextView.text = drink.strInstructions
        guard let url = URL(string: drink.strDrinkThumb ?? "" ) else {return}
        do {
            let data = try Data(contentsOf: url)
            self.drinksImageView.image = UIImage(data: data)
        } catch {
            print("ERROR! Trouble with image url \(url)")
        }
    }
    
    // MARK: Setting Navigation Bar
    private func setNavigationBarImage() {
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goTo))
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -70, bottom: 0, right: 0)
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goTo() {
        coordinator?.drinksView()
    }
}
