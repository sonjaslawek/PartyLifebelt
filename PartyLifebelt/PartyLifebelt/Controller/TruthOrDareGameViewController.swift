//
//  TruthOrDareGameViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 26/01/2023.
//

import UIKit

class TruthOrDareGameViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var result: TruthOrDareModel?
    
    @IBOutlet weak var truthOrDareLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        parseJSON()
    }
    
    @IBAction func truthButton(_ sender: Any) {
        print("truth")
        if let result = result {
            truthOrDareLabel.text = result.questions.randomElement()
        }
    }
    
    @IBAction func dareButton(_ sender: Any) {
        print("dare")
        if let result = result {
            truthOrDareLabel.text = result.dares.randomElement()
        }
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
    
    // MARK: Parsing JSON
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "TruthOrDare", ofType: "json")
        else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonFile = try Data(contentsOf: url)
            result = try JSONDecoder().decode(TruthOrDareModel.self, from: jsonFile)
        } catch {
                print("Error \(error)")
            }
        }
}
