//
//  ThisOrThatGameViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 26/01/2023.
//

import UIKit

class ThisOrThatGameViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

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
        coordinator?.gamesView()
    }
}
