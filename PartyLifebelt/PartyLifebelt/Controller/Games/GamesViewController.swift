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
    @IBOutlet weak var thisOrThatTooltip: UIButton!
    @IBOutlet weak var sevenSecondsTooltip: UIButton!
    
    @IBOutlet weak var gamesButtonsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
    }
    
    @IBAction func truthOrDareGameButton(_ sender: Any) {
        coordinator?.truthOrDareGameView()
    }
    
    @IBAction func neverHaveIEverGameButton(_ sender: Any) {
        coordinator?.neverHaveIEverGameView()
        
    }
    
    @IBAction func thisOrThatGameButton(_ sender: Any) {
        coordinator?.thisOrThatGameView()
    }
    
    @IBAction func sevenSecondsGameButton(_ sender: Any) {
        coordinator?.sevenSecondsGameView()
    }
    
    @IBAction func truthOrDareToolTip(_ sender: Any) {
        
        guard let truth = truthOrDareTooltip.imageView else { return }
        popTip.show(text: "If you choose True - you must trustly answer the question, when you choose Dare - you must do the challange! Easy, isn't it?", direction: .auto, maxWidth: 200, in: truth, from: CGRect(x: truth.frame.height/2, y: truth.frame.width/2, width: 0, height: 0))
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray

    }
    
    @IBAction func neverHaveIEverToolTip(_ sender: Any) {
        
        let finishHeigh = neverHaveIEverTooltip.frame.height + gamesButtonsView.frame.height + 8
        let finishWidth = neverHaveIEverTooltip.frame.width + gamesButtonsView.frame.width - 52
        let fromToolTip = CGRect(x: finishWidth, y: finishHeigh, width: 0, height: 0)
    
        popTip.show(text: "If you see the sentence have you ever do - you need drink your JUICY. It's fun!", direction: .down, maxWidth: 200, in: view, from: fromToolTip)
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray
    }
    
    @IBAction func thisOrThatToolTip(_ sender: Any) {
        
        let finishHeigh = thisOrThatTooltip.frame.height + gamesButtonsView.frame.height + 235
        let finishWidth = thisOrThatTooltip.frame.width + gamesButtonsView.frame.width - 223
        let fromToolTip = CGRect(x: finishWidth, y: finishHeigh, width: 0, height: 0)
    
        popTip.show(text: "Each player chooses one of the options, the option that the minority chose loses and those voting for it must drink!", direction: .down, maxWidth: 200, in: view, from: fromToolTip)
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray
    }
    
    @IBAction func sevenSecondsToolTip(_ sender: Any) {
        
        let finishHeigh = sevenSecondsTooltip.frame.height + gamesButtonsView.frame.height + 235
        let finishWidth = sevenSecondsTooltip.frame.width + gamesButtonsView.frame.width - 52
        let fromToolTip = CGRect(x: finishWidth, y: finishHeigh, width: 0, height: 0)
    
        popTip.show(text: "Get your stopwatch ready! Once the task is displayed and read, the player has 7 seconds to complete the instruction! If he fails he need to drink! Be fast!", direction: .down, maxWidth: 200, in: view, from: fromToolTip)
        popTip.bubbleColor = .white
        popTip.textColor = .black
        popTip.shadowColor = .lightGray
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





