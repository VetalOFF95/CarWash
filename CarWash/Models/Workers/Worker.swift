//
//  Worker.swift
//  CarWash
//
//  Created by  Vitalii on 26.09.2022.
//

import Foundation

protocol WorkerProtocol {
    var salary: Int { get set }
    var experience: Double { get set }
    func doWork<T>(with obj: T)
}

class Worker: WorkerProtocol {
    var salary: Int
    var experience: Double
    
    init(salary: Int, experience: Double) {
        self.salary = salary
        self.experience = experience
    }
    
    func doWork<T>(with obj: T) {
        // should be overriden
    }
}
