//
//  Administration.swift
//  CarWash
//
//  Created by  Vitalii on 14.10.2022.
//

import Foundation

class Administration: AdministrationProtocol {
    var workerAmount: Int {
        return accountantsList.count + directorsList.count
    }
    
    var accountantsList: [WorkerProtocol] = []
    var directorsList: [WorkerProtocol] = []
    var profit = 0.0
    
    func countMoney(money: Double) {
        accountantsList.first?.doWork(with: money)
    }
    
    func takeProfit(money: Double) {
        profit += money
        directorsList.first?.doWork(with: money)
    }
    
    func getProfit() -> Double {
        return profit
    }
}
