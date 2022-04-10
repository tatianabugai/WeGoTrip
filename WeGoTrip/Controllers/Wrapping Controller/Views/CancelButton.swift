//
//  CancelButton.swift
//  WeGoTrip
//
//  Created by admin on 09.04.2022.
//

import UIKit

@IBDesignable
class CancelButton: UIButton {
    
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
        titleLabel?.font = Constants.font
        setTitleColor(Constants.fontColor, for: .normal)
    }
    
    enum Constants {
        static let font = UIFont.systemFont(ofSize: 15, weight: .medium)
        static let fontColor = UIColor.gray
    }
}
