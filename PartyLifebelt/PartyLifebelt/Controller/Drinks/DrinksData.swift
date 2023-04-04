//
//  DrinksData.swift
//  PartyLifebelt
//
//  Created by Sonja on 14/02/2023.
//

import Foundation

class DrinkData {
    
    static let shared = DrinkData()
    struct Returned: Codable {
        var drinks: [DrinkModel]
    }
    
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterIndex = 0
    var isFetching = false
    var drinkArray: [DrinkModel] = []
    
    func getAllData(completed: @escaping () -> () ) {
            
        guard !isFetching else {
            print("ERROR! We hadn't fetch data")
            completed()
            return
        }
        isFetching = true
        
        for letter in letters {
        
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=" + letters[letterIndex]
        print("Succes! URL is \(urlString)")
        letterIndex += 1
        guard let url = URL(string: urlString) else {
            print("ERROR! COULD NOT URL FROM \(urlString)")
            isFetching = false
            completed()
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR! \(error.localizedDescription)")
            }
            
            do {
                guard let data = data else {
                    return 
                }
                
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                self.drinkArray += returned.drinks
                self.drinkArray = self.drinkArray.sorted(by: {$0.strDrink < $1.strDrink})
            } catch {
                print("JSON ERROR! \(error.localizedDescription)")
            }
            completed()
            self.isFetching = false
        }
        task.resume()
        }
        letterIndex = 0
    }
}
