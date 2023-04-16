//
//  FoodViewController.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import UIKit

class FoodViewController: UIViewController, Storyboarded {
    
   
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var foodCollectionView: UICollectionView!
    var foodAPI = FoodData()
    var foodModel: [FoodModel] = []
    var testCell = ["jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy", "jeden", "dwa", "trzy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        setNavigationBarImage()
        foodAPI.getFoodData(endPoint: .snack) {
            print("elo")
        }
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

// MARK: CollectionView Delegate Methods
extension FoodViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return testCell.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testCell.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        cell.titleLabel.text = testCell[indexPath.row]
        cell.titleLabel.textColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.detailFoodView()
    }
}
