//
//  GamesViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class GamesViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
    }
    
    @IBAction func truthOrDareGameButton(_ sender: Any) {
        coordinator?.truthOrDareGameView()
        print("Truth or Dare")
    }
    
    @IBAction func neverHaveIEverGameButton(_ sender: Any) {
        coordinator?.neverHaveIEverGameView()
        print("Never have I ever")
    }
    
    @IBAction func thisOrThatGameButton(_ sender: Any) {
        coordinator?.thisOrThatGameView()
        print("This or That")
    }
    
    @IBAction func sevenSecondsGameButton(_ sender: Any) {
        coordinator?.sevenSecondsGameView()
        print("7 seconds")
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




