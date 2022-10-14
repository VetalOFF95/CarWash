//
//  ViewController.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastPriceLabel: UILabel!
    @IBOutlet weak var sumPriceLabel: UILabel!
    @IBOutlet weak var carsCountLabel: UILabel!
    
    private let carFactory = CarFactory()
    private let carWash = CarWash()
    private let administration = Administration()
    
    private var cars: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareWorkers()
    }
    
    private func prepareWorkers() {
        let washer = Washer(salary: 500, experience: 1)
        let accountant = Accountent(salary: 1000, experience: 2)
        let director = Director(salary: 5000, experience: 7.5)
        
        carWash.workersList.append(washer)
        administration.accountantsList.append(accountant)
        administration.directorsList.append(director)
        
        washer.delegate = self
        accountant.delegate = self
        director.delegate = self
    }
    
    @IBAction func addNewCar(_ sender: UIButton) {
        let nextCar = carFactory.newCar()
        cars += 1
        carsCountLabel.text = "\(cars)"
        carWash.washCar(car: nextCar)
    }
}

extension ViewController: WasherDelegate,
                          AccountentDelegate,
                          DirectorDelegate {
    
    func transferMoneyToAccountant(money: Double) {
        print("Washer has washed the car. Money: \(money)")
        administration.countMoney(money: money)
        lastPriceLabel.text = "$ \(money)"
    }
    
    func transferMoneyToDirector(money: Double) {
        print("Accountent has counted the money. Money: \(money)")
        administration.takeProfit(money: money)
    }
    
    func finishFlow() {
        print("Director has taken profit !")
        sumPriceLabel.text = "$ \(administration.getProfit())"
    }
}

