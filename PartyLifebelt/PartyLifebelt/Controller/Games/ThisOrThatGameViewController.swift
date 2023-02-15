//
//  ThisOrThatGameViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 26/01/2023.
//

import UIKit

class ThisOrThatGameViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var result: ThisOrThatModel?

    @IBOutlet weak var thisLabel: UILabel!
    @IBOutlet weak var thatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        parseJSON()
    }
    
    @IBAction func readyButton(_ sender: Any) {
        print("ready")
        let test = result?.questions.randomElement()
        if let index = test?.range(of: "#")?.upperBound {
            let firstQuestion = test?.components(separatedBy: "#")[0]
            let secondQuestion = test?.components(separatedBy: "#")[1]
            
            thisLabel.text = firstQuestion
            thatLabel.text = secondQuestion
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        print("restart")
        thisLabel.text = "this"
        thatLabel.text = "that?"
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
        guard let path = Bundle.main.path(forResource: "ThisOrThat", ofType: "json")
        else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonFile = try Data(contentsOf: url)
            result = try JSONDecoder().decode(ThisOrThatModel.self, from: jsonFile)
        } catch {
                print("Error \(error)")
            }
        }
}
