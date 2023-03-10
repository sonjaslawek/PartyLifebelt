//
//  DetailFoodViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 10/03/2023.
//

import UIKit

class DetailFoodViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var recipeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
    }
    
    
    // MARK: Setting Navigation Bar
    private func setNavigationBarImage() {
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goTo))
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -70, bottom: 0, right: 0)
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goTo() {
        coordinator?.foodView()
    }
    
   
}
