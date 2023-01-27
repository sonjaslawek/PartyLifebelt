//
//  TruthOrDareGameViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 26/01/2023.
//

import UIKit

class TruthOrDareGameViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    @IBOutlet weak var truthOrDareLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
    }
    
    @IBAction func truthButton(_ sender: Any) {
        print("truth")
        truthOrDareLabel.text = "You choose TRUTH!"
    }
    
    @IBAction func dareButton(_ sender: Any) {
        print("dare")
        truthOrDareLabel.text = "You choose DARE!"
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        print("reset")
        truthOrDareLabel.text = "Choose Truth or Dare!"
        
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
