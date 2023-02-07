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
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonTruth: UIButton!
    @IBOutlet weak var buttonDare: UIButton!
    //@IBOutlet weak var appNameLogo: UIImageView!
    
    var buttonCons: [NSLayoutConstraint] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarImage()
        parseJSON()
        //setupConstraints()

        //appNameLogo.contentMode = .scaleAspectFit
        
       // buttonTruth.imageView?.contentMode = .scaleAspectFit
        buttonTruth.layer.cornerRadius = 8.0
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
    //MARK: Contraints for view
    
    func setupConstraints() {
        //appNameLogo.translatesAutoresizingMaskIntoConstraints = false
        buttonTruth.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            appNameLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            appNameLogo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0),
//            appNameLogo.heightAnchor.constraint(equalToConstant: 300.0),
//            appNameLogo.widthAnchor.constraint(equalToConstant: 300.0),
            //appNameLogo.bottomAnchor.constraint(equalTo: buttonTruth.topAnchor),
            
            //buttonTruth.topAnchor.constraint(equalTo: appNameLogo.bottomAnchor, constant: 40),
            buttonTruth.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            buttonTruth.heightAnchor.constraint(equalToConstant: 44),
            buttonTruth.widthAnchor.constraint(equalToConstant: 132),
            //buttonTruth.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -50),
            //buttonTruth.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
           // buttonTruth.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 40)
        ])
        var appLogoCons: [NSLayoutConstraint] = []
//        //let appHeight = appNameLogo.heightAnchor.constraint(equalToConstant: 10.0)
//       // let appWidth = appNameLogo.widthAnchor.constraint(equalToConstant: 500.0)
//        let test = appNameLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200.0)
//        let k = appNameLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 200)
//        let topConstraintAL = appNameLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0)
//
//        let bottomConstraintAL = appNameLogo.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        let leftConstraintAL = appNameLogo.leftAnchor.constraint(equalTo: self.view.leftAnchor)
//        let rightConstraintAL = appNameLogo.rightAnchor.constraint(equalTo: self.view.rightAnchor)
//        appLogoCons = //[ appHeight, appWidth,
//                        [topConstraintAL, bottomConstraintAL, leftConstraintAL, rightConstraintAL, test, k]
//        NSLayoutConstraint.activate(appLogoCons)
        
        var buttonDareCons: [NSLayoutConstraint] = []
        buttonDare.translatesAutoresizingMaskIntoConstraints = false
        let topConstraintBD = buttonDare.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraintBD = buttonDare.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraintBD = buttonDare.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightConstraintBD = buttonDare.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        buttonDareCons = [topConstraintBD, bottomConstraintBD, leftConstraintBD, rightConstraintBD]
        NSLayoutConstraint.activate(buttonDareCons)
        
        var buttonTruthCons: [NSLayoutConstraint] = []
        buttonTruth.translatesAutoresizingMaskIntoConstraints = false
        let topConstraintBT = buttonTruth.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraintBT = buttonTruth.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraintBT = buttonTruth.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightConstraintBT = buttonTruth.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        buttonTruthCons = [topConstraintBT, bottomConstraintBT, leftConstraintBT, rightConstraintBT]
        NSLayoutConstraint.activate(buttonTruthCons)
        
        
        var textLabelCons: [NSLayoutConstraint] = []
        truthOrDareLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraintTX = truthOrDareLabel.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraintTX = truthOrDareLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraintTX = truthOrDareLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightConstraintTX = truthOrDareLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        textLabelCons = [topConstraintTX, bottomConstraintTX, leftConstraintTX, rightConstraintTX]
        NSLayoutConstraint.activate(textLabelCons)
        
        var buttonResetCons: [NSLayoutConstraint] = []
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        let topConstraintRS = buttonReset.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraintRS = buttonReset.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraintRS = buttonReset.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightConstraintRS = buttonReset.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        textLabelCons = [topConstraintRS, bottomConstraintRS, leftConstraintRS, rightConstraintRS]
        NSLayoutConstraint.activate(buttonResetCons)
    }
}
