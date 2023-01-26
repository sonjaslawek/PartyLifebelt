//
//  Coordinator.swift
//  PartyLifebelt
//
//  Created by Sonja on 25/01/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
