//
//  FoodData.swift
//  PartyLifebelt
//
//  Created by Sonja on 09/03/2023.
//

import Foundation
import Alamofire

enum EndPointType: String {
    case snack = "&mealType=Snack"
    case vegan = "&health=vegan" // TODO?
    case brunch = "&mealType=Brunch"
}

class FoodData {
    
    
    let appID = "d14bc5eb"
    let appKey = "d6a6072ff3ea8cf035a491e22747124b"
    var foodModel: [FoodModel] = []
    var hitsy: [Hit] = []
    
    struct FoodModel: Codable {
        let from, to, count: Int
        let links: FoodModelLinks
        let hits: [Hit]

        enum CodingKeys: String, CodingKey {
            case from, to, count
            case links = "_links"
            case hits
        }
    }
    
    func getFoodData(endPoint: EndPointType, completed: @escaping () -> ()) {
        
        let endpoint = "https://api.edamam.com/api/recipes/v2?type=public&app_id=\(appID)&app_key=\(appKey)\(endPoint.rawValue)"
        
        AF.request(endpoint).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let jsonData = try JSONDecoder().decode(FoodModel.self, from: response.data!)
                    self.foodModel = [jsonData]
                    completed()
                    print("test \(self.foodModel)")
                    print(self.foodModel[0].hits[0].recipe.label)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
                print(response.data)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
