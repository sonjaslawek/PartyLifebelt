//
//  DashboardViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 23/01/2023.
//

import UIKit

class DashboardViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: nil, style: .done, target: self, action: nil)
    }

    @IBAction func gamesButton(_ sender: Any) {
        coordinator?.gamesView()
        print("games clicked")
    }
    
    @IBAction func drinksButton(_ sender: Any) {
        print("drinks clicked")
        coordinator?.drinksView()
    }
    
    @IBAction func foodButton(_ sender: Any) {
        print("food clicked")
        coordinator?.foodView()
    }
}

