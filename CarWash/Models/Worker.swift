//
//  Worker.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

//MARK:
//MARK: - Protocols
protocol WorkerProtocol {
    var salary: Int { get set }
    var experience: Double { get set }
    func doWork(car: CarProtocol)
}

protocol WasherDelegate: WorkerProtocol {
    var delegate: AccountentDelegate? { get set }
}

protocol AccountentDelegate: WorkerProtocol {
    var delegate: DirectorDelegate? { get set }
}

protocol DirectorDelegate: WorkerProtocol {
    
}

//MARK: 
//MARK: - Classes
class Worker: WorkerProtocol {
    var salary: Int
    var experience: Double
    
    init(salary: Int, experience: Double) {
        self.salary = salary
        self.experience = experience
    }
    
    func doWork(car: CarProtocol) {
        // should be overriden
    }
}

class Washer: Worker, WasherDelegate {
    var delegate: AccountentDelegate?
    
    override func doWork(car: CarProtocol) {
        print("Washer washes the car. Status: \(car.status), money: \(car.money)")
        var cleanCar = car
        cleanCar.status = .clean
        delegate?.doWork(car: cleanCar)
    }
}

class Accountent: Worker, AccountentDelegate {
    var delegate: DirectorDelegate?
    
    override func doWork(car: CarProtocol) {
        print("Accountent counts the money. Status: \(car.status), money: \(car.money)")
        delegate?.doWork(car: car)
    }
}

class Director: Worker, DirectorDelegate {
    override func doWork(car: CarProtocol) {
        print("Director make profit: \(car.money)")
    }
}
