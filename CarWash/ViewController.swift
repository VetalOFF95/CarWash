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
        
        let carWashRoom = CarWashRoom(delegate: washer)
        let administrationRoom = AdministrationRoom(accountentDelegate: accountant, directorDelegate: director)
        
        carWash.rooms.append(carWashRoom)
        administration.rooms.append(administrationRoom)
        
        let car = Car(money: 350)
        carWash.rooms[0].washCar(car: car)
    }
}

