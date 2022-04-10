//
//  UIView-AsImage.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
