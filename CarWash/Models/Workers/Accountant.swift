//
//  Accountant.swift
//  CarWash
//
//  Created by  Vitalii on 14.10.2022.
//

import Foundation

protocol AccountentDelegate {
    func transferMoneyToDirector(money: Double)
}

class Accountent: Worker {
    var delegate: AccountentDelegate?
    
    override func doWork<T>(with obj: T) {
        guard let money = obj as? Double else {
            return
        }
        
        delegate?.transferMoneyToDirector(money: money)
    }
}
