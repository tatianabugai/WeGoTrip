//
//  ActivityIndicatorView.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import Foundation
import UIKit

@IBDesignable
class ActivityIndicatorView: UIView, Describable {
    
    // MARK: - Outlets
    @IBOutlet private var view: UIView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Methods
    func start() {
        activityIndicator.startAnimating()
        isHidden = false
    }
    
    func stop() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
 
    // MARK: - Help Handlers
    private func setup() {
        
        Bundle.main.loadNibNamed(ActivityIndicatorView.typeName, owner: self, options: nil)
        
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.layer.cornerRadius = bounds.height / 4
        
        backgroundColor = .clear
    }
    
}
