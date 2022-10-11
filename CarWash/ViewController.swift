//
//  ViewController.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carWash = CarWash()
        let administration = Administration()
        
        let washer = Washer(salary: 500, experience: 1)
        let accountant = Accountent(salary: 1000, experience: 2)
        let director = Director(salary: 5000, experience: 7.5)
        washer.delegate = accountant
        accountant.delegate = director
        
        let carWashRoom = CarWashRoom()
        carWashRoom.workerList.append(washer)
        
        let administrationRoom = AdministrationRoom()
        
        carWash.rooms.append(carWashRoom)
        administration.rooms.append(administrationRoom)
        
        var carFactory = CarFactory()

        carWashRoom.carList = carFactory.newCars(count: 10)
        carWash.rooms[0].washCars()
    }
}

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
}

