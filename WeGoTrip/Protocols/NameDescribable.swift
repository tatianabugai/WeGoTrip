//
//  NameDescribable.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import Foundation

protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
    static var typeName: String {
        return String(describing: self)
    }
}


