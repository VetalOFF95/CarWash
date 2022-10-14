//
//  Building.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

protocol BuildingProtocol {
    var workerAmount: Int { get }
}

protocol CarWashProtocol: BuildingProtocol {
    var workersList: [WorkerProtocol] { get set}
    var carsList: [CarProtocol] { get set }
}

protocol AdministrationProtocol: BuildingProtocol {
    var accountantsList: [WorkerProtocol] { get set}
    var directorsList: [WorkerProtocol] { get set}
    var profit: Double { get set }
}
