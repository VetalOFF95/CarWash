//
//  Room.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

//MARK:
//MARK: - Protocols
protocol RoomProtocol {
    var workerAmount: Int { get set }
}

protocol CarWashRoomProtocol: RoomProtocol {
    var workerList: [WorkerProtocol] { get set}
    var carList: [CarProtocol] { get set }
    
    func washCars()
}

protocol AdmitistrationRoomProtocol: RoomProtocol {
    var workerList: [WorkerProtocol] { get set}
}

//MARK: 
//MARK: - Classes
class CarWashRoom: CarWashRoomProtocol {
    var workerAmount: Int = 0
    var workerList: [WorkerProtocol] = []
    var carList: [CarProtocol] = []
    
    func washCars() {
        for car in carList {
            workerList.first?.doWork(car: car)
        }
    }
}

class AdministrationRoom: AdmitistrationRoomProtocol {
    var workerAmount: Int = 0
    var workerList: [WorkerProtocol] = []
}
