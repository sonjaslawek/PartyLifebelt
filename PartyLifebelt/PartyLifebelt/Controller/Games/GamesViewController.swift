//
//  GamesViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit
import AMTooltip

class GamesViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
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
        
        AMTooltipView(
            options:AMTooltipViewOptions(
                side: .bottom,
                textColor: UIColor.black,
                textBoxBackgroundColor: UIColor.white,
                addOverlayView: true,
                lineColor: UIColor.clear,
                lineHeight: 4,
                dotColor: UIColor.clear,
                dotBorderColor: UIColor.clear
            ),
            message: "If you choose True - you must trustly answer the question, when you choose Dare - you must do the challange! Easy, isn't it?",
            focusView: sender as! UIView,
            target: self)
    }
    
    @IBAction func neverHaveIEverToolTip(_ sender: Any) {
        AMTooltipView(
            options:AMTooltipViewOptions(
                side: .bottom,
                textColor: UIColor.black,
                textBoxBackgroundColor: UIColor.white,
                addOverlayView: true,
                lineColor: UIColor.clear,
                lineHeight: 4,
                dotColor: UIColor.clear,
                dotBorderColor: UIColor.clear
            ),
            message: "If you see the sentence have you ever do - you need drink your JUICY. It's fun!",
            focusView: sender as! UIView,
            target: self)
    }
    
    @IBAction func thisOrThatToolTip(_ sender: Any) {
        AMTooltipView(
            options:AMTooltipViewOptions(
                side: .auto,
                textColor: UIColor.black,
                textBoxBackgroundColor: UIColor.white,
                addOverlayView: true,
                lineColor: UIColor.clear,
                dotColor: UIColor.clear,
                dotBorderColor: UIColor.clear
            ),
            message: "Each player chooses one of the options, the option that the minority chose loses and those voting for it must drink!",
            focusView: sender as! UIView,
            target: self)
    }
    
    @IBAction func sevenSecondsToolTip(_ sender: Any) {
        AMTooltipView(
            options:AMTooltipViewOptions(
                side: .auto,
                textColor: UIColor.black,
                textBoxBackgroundColor: UIColor.white,
                addOverlayView: true,
                lineColor: UIColor.clear,
                lineHeight: 4,
                dotColor: UIColor.clear,
                dotBorderColor: UIColor.clear
            ),
            message: "Get your stopwatch ready! Once the task is displayed and read, the player has 7 seconds to complete the instruction! If he fails he need to drink! Be fast!",
            focusView: sender as! UIView,
            target: self)
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





