//
//  FoodData.swift
//  PartyLifebelt
//
//  Created by Sonja on 09/03/2023.
//

import Foundation
import Alamofire

class FoodData {
    
    struct FoodResponse: Codable {
        let foods: [FoodModel]
    }
    
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterIndex = 0
    
    var foodArray: [FoodModel] = []
    
    func getFoodData() {
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=a"
        
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(FoodResponse.self, from: data!)
                    self.foodArray = jsonData.foods
                    print("asd \(self.foodArray)")
                } catch {
                    print(error.localizedDescription)
                }
                print(response.data)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
