//
//  FoodData.swift
//  PartyLifebelt
//
//  Created by Sonja on 09/03/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class FoodData {
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterIndex = 0
   
    var foodArray: [FoodModel] = []
    
    
    func getFoodData() {
        let url = "www.themealdb.com/api/json/v1/1/search.php?f=A" //+ letters[letterIndex]
        
//        AF.request(url, method: .get, parameters: foodArray, encoder: ParameterEncoder.self as! ParameterEncoder, headers: nil, interceptor: nil).response { responce in
//            switch responce.result {
//            case .success(let data):
//                print("juhu")
//            case .failure(let error):
//                print("buuu")
//            }
//        }
}
}
