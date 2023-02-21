//
//  DrinksData.swift
//  PartyLifebelt
//
//  Created by Sonja on 14/02/2023.
//

import Foundation
class DrinksDataClass {
    
    struct Returned: Codable {
        var drinks: [Drinks]
    }
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var letterIndex = 0
    var isFetching = false
    
    var baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="
    var drinkArray: [Drinks] = []
    
    func getData(completed: @escaping () -> () ) {
        
        guard !isFetching else {
            print("ERROR! We hadn't fetch data")
            completed()
            return
        }
        isFetching = true
        
        let urlString = baseURL + letters[letterIndex]
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
            } catch {
                print("JSON ERROR! \(error.localizedDescription)")
            }
            completed()
            self.isFetching = false
        }
        task.resume()
    }
}
