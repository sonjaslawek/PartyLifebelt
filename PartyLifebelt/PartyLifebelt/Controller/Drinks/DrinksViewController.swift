//
//  DrinksViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class DrinksViewController: UIViewController, Storyboarded  {
    
    weak var coordinator: MainCoordinator?
    var drink = DrinksDataClass()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        drink.getData {
            print("\(self.drink.drinkArray)")
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
