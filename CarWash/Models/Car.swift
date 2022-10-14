//
//  Car.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

enum CarStatus {
    case dirty
    case clean
}

protocol CarProtocol {
    var status: CarStatus { get set }
    var money: Double { get set }
}

class Car: CarProtocol {
    var status: CarStatus
    var money: Double
    
    init(money: Double) {
        self.money = money
        self.status = .dirty
    }
}
