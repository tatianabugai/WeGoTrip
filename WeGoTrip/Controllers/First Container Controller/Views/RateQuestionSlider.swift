//
//  QuestionSlider.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import Foundation
import StepSlider
import UIKit

@IBDesignable
class RateQuestionSlider: StepSlider {
    
    // MARK: - Properties
    
    private let sliderImage: UIImage = {
        
        let contentView = UIView()
        let width: CGFloat = 26
        let size = CGSize(width: width, height: width)
        let origin = CGPoint(x: 0, y: 0)
        contentView.frame = CGRect(origin: origin, size: size)
        
        let sliderView = UIImageView()
        sliderView.backgroundColor = UIColor.white
        sliderView.layer.shadowColor = Constants.Colors.shadow.cgColor
        sliderView.layer.shadowOffset = CGSize(width: 0, height: 1)
        sliderView.layer.shadowOpacity = 1
        sliderView.layer.shadowRadius = 1
        sliderView.frame = CGRect(origin: origin, size: size)
        let sliderWidth = 0.8 * width
        let sliderSize = CGSize(width: sliderWidth, height: sliderWidth)
        let center = CGPoint(x: contentView.bounds.midX, y: contentView.bounds.midY)
        sliderView.frame.size = sliderSize
        sliderView.center = center
        sliderView.layer.cornerRadius = sliderWidth / 2
       
        contentView.addSubview(sliderView)
        
        let image = contentView.asImage()
        return image
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Help Handlers
    
    private func setup() {
        sliderCircleImage = sliderImage
        trackHeight = 1
        trackCircleRadius = 2
        trackColor = Constants.Colors.track
        tintColor = Constants.Colors.track
        maxCount = 5
        index = 3        
    }
    
    // MARK: - Constants
    
    enum Constants {
        enum Colors {
            static let track = #colorLiteral(red: 0.8612362122, green: 0.8612362122, blue: 0.8612362122, alpha: 1)
            static let shadow = UIColor.lightGray
        }
    }
}
