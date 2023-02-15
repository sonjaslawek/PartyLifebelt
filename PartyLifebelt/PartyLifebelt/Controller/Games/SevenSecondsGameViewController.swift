//
//  SevenSecondsGameViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 26/01/2023.
//

import UIKit

class SevenSecondsGameViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var result: SevenSecondsModel?

    @IBOutlet weak var sevenSecondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        parseJSON()
    }
    
    @IBAction func startButton(_ sender: Any) {
        print("start")
        sevenSecondsLabel.text = result?.questions.randomElement()
    }
    
    @IBAction func restartButton(_ sender: Any) {
        print("restart")
        sevenSecondsLabel.text = "...tik tak, tik tak..."
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
        guard let path = Bundle.main.path(forResource: "SevenSeconds", ofType: "json")
        else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonFile = try Data(contentsOf: url)
            result = try JSONDecoder().decode(SevenSecondsModel.self, from: jsonFile)
        } catch {
                print("Error \(error)")
            }
        }
    
}
