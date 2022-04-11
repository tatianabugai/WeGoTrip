//
//  TextQuestionView.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import Foundation
import UIKit

@IBDesignable
class TextQuestionView: UIView, Describable {
    
    // MARK: - Outlets
    @IBOutlet private var view: UIView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerTextView: TextViewWithPlaceholder!
    
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
        Bundle.main.loadNibNamed(TextQuestionView.typeName, owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        questionLabel.font = Constants.font
    }
    
    // MARK: - Constants
    enum Constants {
        static let font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
}
