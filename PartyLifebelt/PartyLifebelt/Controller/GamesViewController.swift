//
//  GamesViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit
import AMPopTip

class GamesViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var popTip = PopTip()
    @IBOutlet weak var truthOrDareTooltip: UIButton!
    @IBOutlet weak var neverHaveIEverTooltip: UIButton!
    
    @IBOutlet weak var gamesButtonsView: UIView!
    
    
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
    
    @IBAction func truthOrDareToolTip(_ sender: Any) {
        print("tooltip1")
        
        print(truthOrDareTooltip.frame)
        let finiszHeigh = truthOrDareTooltip.frame.height + gamesButtonsView.frame.height + 33
        let finiszWidth = truthOrDareTooltip.frame.width + gamesButtonsView.frame.width - 66
        let fromToolTip = CGRect(x: 0, y: 0, width: finiszWidth, height: finiszHeigh)
    
        popTip.show(text: "If you choose True - you must trustly answer the question, when you choose Dare - you must do the challange! Easy, isn't it?", direction: .down, maxWidth: 200, in: view, from: fromToolTip)
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray

    }
    
    @IBAction func neverHaveIEverToolTip(_ sender: Any) {
        print("tooltip2")
        print(neverHaveIEverTooltip.frame)
        print(gamesButtonsView.frame)
        
        
        let finiszHeigh = neverHaveIEverTooltip.frame.height + gamesButtonsView.frame.height + 33
        let finiszWidth = neverHaveIEverTooltip.frame.width + gamesButtonsView.frame.width - 66
        let fromToolTip = CGRect(x: finiszWidth, y: finiszHeigh, width: 0, height: 0)
    
        popTip.show(text: "If you see the sentence have you ever do - you need drink your JUICY. It's fun!", direction: .down, maxWidth: 200, in: view, from: fromToolTip)
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray
    }
    
    @IBAction func thisOrThatToolTip(_ sender: Any) {
    }
    
    @IBAction func sevenSecondsToolTip(_ sender: Any) {
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

// MARK: Constraints for buttons





