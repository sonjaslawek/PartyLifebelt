//
//  DrinksData.swift
//  PartyLifebelt
//
//  Created by Sonja on 14/02/2023.
//

import Foundation

class DrinksDataClass {
    
    struct Returned: Codable {
        var drinks: [DrinksData]
    }
    
    struct DrinksData: Codable {
        var strDrink = ""
    }
    
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=A"
    var drinkArray: [DrinksData] = []
    
    func getData(completed: @escaping () -> () ) {
        print("Succes! URL is \(urlString)")
  
        guard let url = URL(string: urlString) else {
            print("ERROR! COULD NOT URL FROM \(urlString)")
            completed()
            return
        }
    
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR! \(error.localizedDescription)")
            }
        
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.drinkArray = returned.drinks
            } catch {
                print("JSON ERROR! \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
