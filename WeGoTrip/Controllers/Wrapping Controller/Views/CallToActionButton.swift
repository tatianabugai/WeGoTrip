//
//  Button.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import UIKit

@IBDesignable
class CallToActionButton: UIButton {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    
    // MARK: - Help handlers
    private func setup() {
        backgroundColor = Constants.backgroundColor
        setTitleColor(Constants.fontColor, for: .normal)
        titleLabel?.font = Constants.font
        
        // Height
        let height = Constants.height
        heightAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = height / 5
    }
    
    enum Constants {
        static let font = UIFont.systemFont(ofSize: 15, weight: .medium)
        static let fontColor = UIColor.white
        static let backgroundColor: UIColor = #colorLiteral(red: 0.337254902, green: 0.2823529412, blue: 0.9725490196, alpha: 1)
        static let height: CGFloat = 50        
    }
}
