//
//  QuestionView.swift
//  WeGoTrip
//
//  Created by admin on 07.04.2022.
//

import UIKit

final class RateQuestionView: UIView, Describable {
    
    // MARK: - Outlets
    @IBOutlet private var view: UIView!
    @IBOutlet var slider: RateQuestionSlider!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
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
        Bundle.main.loadNibNamed(RateQuestionView.typeName, owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

