//
//  Director.swift
//  CarWash
//
//  Created by  Vitalii on 14.10.2022.
//

import Foundation

protocol DirectorDelegate {
    func finishFlow()
}

class Director: Worker {
    var delegate: DirectorDelegate?
    
    override func doWork<T>(with obj: T) {
        guard let money = obj as? Double else {
            return
        }
        
        delegate?.finishFlow()
    }
}
