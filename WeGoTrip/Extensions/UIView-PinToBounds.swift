//
//  UIView-PinToBounds.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func pinToBounds(of view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
}

