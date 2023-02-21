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
        ingredientList()
    }
    
    func fullIngredients(measure: String?, ingredient: String?) {
        guard measure != nil else {return}
        ingredientsTextView.text += measure!
        guard ingredient != nil else {return}
        ingredientsTextView.text += " \(ingredient!)\n"
    }
    
    func ingredientList() {
        ingredientsTextView.text = ""
        fullIngredients(measure: drink.strMeasure1, ingredient: drink.strIngredient1)
        fullIngredients(measure: drink.strMeasure2, ingredient: drink.strIngredient2)
        fullIngredients(measure: drink.strMeasure3, ingredient: drink.strIngredient3)
        fullIngredients(measure: drink.strMeasure4, ingredient: drink.strIngredient4)
        fullIngredients(measure: drink.strMeasure5, ingredient: drink.strIngredient5)
        fullIngredients(measure: drink.strMeasure6, ingredient: drink.strIngredient6)
        fullIngredients(measure: drink.strMeasure7, ingredient: drink.strIngredient7)
        fullIngredients(measure: drink.strMeasure8, ingredient: drink.strIngredient8)
        fullIngredients(measure: drink.strMeasure9, ingredient: drink.strIngredient9)
        fullIngredients(measure: drink.strMeasure10, ingredient: drink.strIngredient10)
        fullIngredients(measure: drink.strMeasure11, ingredient: drink.strIngredient11)
        fullIngredients(measure: drink.strMeasure12, ingredient: drink.strIngredient12)
        fullIngredients(measure: drink.strMeasure13, ingredient: drink.strIngredient13)
        fullIngredients(measure: drink.strMeasure14, ingredient: drink.strIngredient14)
        fullIngredients(measure: drink.strMeasure15, ingredient: drink.strIngredient15)
        if ingredientsTextView.text != "" {
            ingredientsTextView.text.removeLast()
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
