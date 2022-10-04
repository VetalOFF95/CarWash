//
//  Worker.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

//MARK: - Protocols
protocol WorkerProtocol {
    var salary: Int { get set }
    var experience: Double { get set }
}

protocol WasherDelegate {
    func washCar(car: CarProtocol)
}

protocol AccountentDelegate {
    func countMoney(money: Double) -> Double
}

protocol DirectorDelegate {
    func makeProfit(money: Double)
}

//MARK: - Classes
class Worker: WorkerProtocol {
    var salary: Int
    var experience: Double
    
    init(salary: Int, experience: Double) {
        self.salary = salary
        self.experience = experience
    }
}

class Washer: Worker, WasherDelegate {
    func washCar(car: CarProtocol){
        print("Washer washes the car")
        var cleanCar = car
        cleanCar.status = .clean
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "giveMoneyToAccountant"),
                                        object: nil,
                                        userInfo: ["money": cleanCar.money])
    }
}

class Accountent: Worker, AccountentDelegate {
    func countMoney(money: Double) -> Double {
        print("Accountent counts the money")
        return money
    }
}

class Director: Worker, DirectorDelegate {
    func makeProfit(money: Double) {
        print("Make profit")
    }
}
