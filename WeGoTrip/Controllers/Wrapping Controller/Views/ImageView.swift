//
//  Image.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import Foundation
import UIKit

@IBDesignable
class ImageView: UIImageView {
    
    // MARK: - Properties
    /// Placeholder for an image while it's fetching.
    private let placeholder: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.placeholderColor
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    override var image: UIImage? {
        didSet {
            placeholder.removeFromSuperview()
        }
    }
    
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
       
        let height = Constants.height
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.backgroundColor
        
        addSubview(placeholder)
        startFetchingAnimation()
    }
    
    private func startFetchingAnimation() {
        // Fade to ligher gray
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: { [weak self] in
            self?.placeholder.alpha = 0.3
        },
                       completion: { _ in
            // Fade back
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [.curveLinear],
                           animations: { [weak self] in
                self?.placeholder.alpha = 1
            },
                           completion: { [weak self] _ in
                self?.startFetchingAnimation()
            })
        })
    }
    
    override func layoutSubviews() {
        placeholder.frame = bounds
    }
    
    enum Constants {
        static let backgroundColor = UIColor.white
        static let height: CGFloat = 70
        static let placeholderColor = #colorLiteral(red: 0.8754309452, green: 0.8754309452, blue: 0.8754309452, alpha: 1)
        static let cornerRadius: CGFloat = Constants.height / 2
    }
}
