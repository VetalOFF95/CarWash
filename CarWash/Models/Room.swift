//
//  Room.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

//MARK: - Protocols
protocol RoomProtocol {
    var workerAmount: Int { get set }
}

protocol CarWashRoomProtocol: RoomProtocol {
    var workerList: [WorkerProtocol] { get set}
    var carList: [CarProtocol] { get set }
    
    var delegate: WasherDelegate? { get set }
    
    init(delegate: WasherDelegate)
    
    func washCar(car: CarProtocol)
}

protocol AdmitistrationRoomProtocol: RoomProtocol {
    var workerList: [WorkerProtocol] { get set}
    
    var accountentDelegate: AccountentDelegate? { get set }
    var directorDelegate: DirectorDelegate? { get set }
    
    init(accountentDelegate: AccountentDelegate, directorDelegate: DirectorDelegate)
    
    func countMoney(notification: Notification)
}

//MARK: - Classes
class CarWashRoom: CarWashRoomProtocol {
    var workerAmount: Int = 0
    var workerList: [WorkerProtocol] = []
    var carList: [CarProtocol] = []
    
    var delegate: WasherDelegate?
    
    required init(delegate: WasherDelegate) {
        self.delegate = delegate
    }
    
    func washCar(car: CarProtocol) {
        delegate?.washCar(car: car)
    }
}

class AdministrationRoom: AdmitistrationRoomProtocol {
    var workerAmount: Int = 0
    var workerList: [WorkerProtocol] = []
    
    var accountentDelegate: AccountentDelegate?
    var directorDelegate: DirectorDelegate?
    
    required init(accountentDelegate: AccountentDelegate, directorDelegate: DirectorDelegate) {
        self.accountentDelegate = accountentDelegate
        self.directorDelegate = directorDelegate
        
        NotificationCenter.default.addObserver(self, selector: #selector(countMoney), name: NSNotification.Name(rawValue: "giveMoneyToAccountant"), object: nil)
    }
    
    @objc func countMoney(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let money = userInfo["money"] as? Double else {
            return
        }
        
        let profit = self.accountentDelegate?.countMoney(money: money)
        self.directorDelegate?.makeProfit(money: profit ?? 0)
    }
}
