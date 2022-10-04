//
//  Building.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

//MARK: - Protocols
protocol BuildingProtocol {

}

protocol CarWashProtocol: BuildingProtocol {
    var rooms: [CarWashRoomProtocol] { get set }
}

protocol AdministrationProtocol: BuildingProtocol {
    var rooms: [AdmitistrationRoomProtocol] { get set }
}

//MARK: - Classes
class CarWash: CarWashProtocol {
    var rooms: [CarWashRoomProtocol] = []
}

class Administration: AdministrationProtocol {
    var rooms: [AdmitistrationRoomProtocol] = []
}
