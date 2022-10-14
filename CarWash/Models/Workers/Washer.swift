//
//  Washer.swift
//  CarWash
//
//  Created by  Vitalii on 14.10.2022.
//

import Foundation

protocol WasherDelegate {
    func transferMoneyToAccountant(money: Double)
}

class Washer: Worker {
    var delegate: WasherDelegate?
    
    override func doWork<T>(with obj: T) {
        guard let car = obj as? any CarProtocol else {
            return
        }
        
        var cleanCar = car
        cleanCar.status = .clean
        delegate?.transferMoneyToAccountant(money: cleanCar.money)
    }
}
