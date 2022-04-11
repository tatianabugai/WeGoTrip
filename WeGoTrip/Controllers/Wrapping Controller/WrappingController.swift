//
//  WrappingController.swift
//  WeGoTrip
//
//  Created by admin on 09.04.2022.
//

import UIKit

protocol WrappingControllerDataSource {
    func callToActionButtonTapped()
    func cancelButtonTapped()
    var callToActionButtonTitle: String { get }
    var cancelButtonTitle: String { get }
}

class WrappingController: UIViewController, Describable {
    
    // MARK: - Outlets
    @IBOutlet private var imageView: ImageView!
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var callToActionButton: CallToActionButton!
    @IBOutlet private var cancelButton: UIButton!
    
    // MARK: - Properties
    /// Container view controller for an embedded content.
    private let containerVC: UIViewController
    private let dataSource: WrappingControllerDataSource
    
    // MARK: - Init    
    init(containerVC: UIViewController, dataSource: WrappingControllerDataSource) {
        self.containerVC = containerVC
        self.dataSource = dataSource
        super.init(nibName: WrappingController.typeName, bundle: Bundle.main)
    }
    required init?(coder: NSCoder) {
        fatalError("Use init(container:dataSource:")
    }
    
    // MARK: - VieeController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc func callToActionButtonTapped(_ sender: CallToActionButton) {
        dataSource.callToActionButtonTapped()
    }
    
    @objc func cancelButtonTapped(_ sender: CancelButton) {
        dataSource.cancelButtonTapped()
    }
    
    // MARK: - Help Handlers
    
    private func setupView() {
        
        // Setup imageView
        let url = Constants.imageURL
        NetworkManager.shared.fetchImage(at: url, completion: { image in
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = image
            }
        })
        
        // Setup container
        addChild(containerVC)
        containerView.addSubview(containerVC.view)
        containerVC.view.pinToBounds(of: containerView)
        containerVC.didMove(toParent: self)
        
        // Setup buttons
        callToActionButton.setTitle(dataSource.callToActionButtonTitle, for: .normal)
        cancelButton.setTitle(dataSource.cancelButtonTitle, for: .normal)
        callToActionButton.addTarget(self, action: #selector(callToActionButtonTapped(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
    }
    
    enum Constants {
        static let imageURL = URL(string: "https://app.wegotrip.com/media/users/1/path32.png")!
    }
    
}

