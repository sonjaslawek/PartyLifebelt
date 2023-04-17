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
    var foodModel: [Hit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        setNavigationBarImage()
        loadFoodData()
    }
    func loadFoodData() {
        foodAPI.getFoodData(endPoint: .brunch, completed: {
            print(self.foodAPI.foodModel.count)
            DispatchQueue.main.async {
                self.foodModel = self.foodAPI.foodModel[0].hits
                self.foodCollectionView.reloadData()
            }
        })
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
        return foodModel.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        cell.titleLabel.text = foodModel[indexPath.row].recipe.label
        print("TESTUJE \(foodModel[indexPath.row].recipe.label)")
        cell.titleLabel.textColor = .white
        let img = foodModel[indexPath.item].recipe.images.small.url
        cell.imageView.image = UIImage(named: img)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.detailFoodView()
    }
}
