//
//  CarFactory.swift
//  CarWash
//
//  Created by  Vitalii on 13.10.2022.
//

import Foundation

class CarFactory {
    var carList: [CarProtocol] = []
    
    func newCars(count: Int) -> [CarProtocol] {
        var i = 0
        while i < count {
            let car = Car(money: Double.random(in: 100...1000).rounded())
            carList.append(car)
            i += 1
        }
        return carList
    }
    
    func newCar() -> CarProtocol {
        return Car(money: Double.random(in: 100...1000).rounded())
    }
}
