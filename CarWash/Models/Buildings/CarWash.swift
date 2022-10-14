//
//  CarWash.swift
//  CarWash
//
//  Created by  Vitalii on 14.10.2022.
//

import Foundation

class CarWash: CarWashProtocol {
    var workerAmount: Int {
        return workersList.count
    }
    
    var workersList: [WorkerProtocol] = []
    var carsList: [CarProtocol] = []
    
    func washCar(car: CarProtocol) {
        carsList.append(car)
        workersList.first?.doWork(with: car)
    }
}
