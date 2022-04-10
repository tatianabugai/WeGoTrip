//
//  TextViewWithPlaceholder.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import UIKit

@IBDesignable
class TextViewWithPlaceholder: UITextView {
    
    // MARK: - Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.font
        label.textColor = Constants.placeholderTextColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        placeholderLabel.frame = bounds
        placeholderLabel.sizeToFit()
    }
    
    // MARK: - Methods
    
    func hidePlacehoder() {
        placeholderLabel.isHidden = true
    }
    
    func showPlaceholder() {
        placeholderLabel.isHidden = false
    }
    
    // MARK: - Help Handlers
    
    private func setup() {
        // Text View
        textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        textColor = Constants.textColor
        font = Constants.font
        
        // Placeholder
        addSubview(placeholderLabel)
    }
    
    // MARK: - Constants
    
    enum Constants {
        static let font = UIFont.systemFont(ofSize: 17)
        static let textColor = UIColor.black
        static let placeholderTextColor = UIColor.lightGray
    }
}
