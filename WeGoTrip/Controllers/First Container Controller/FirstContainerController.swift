//
//  FirstController.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import UIKit



class FirstContainerController: UIViewController, NameDescribable, WrappingControllerDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var questionViews: [RateQuestionView]!
    
    // MARK: - Properties
    
    private var review: Review

    // MARK: - Init
    
    init(review: Review) {
        self.review = review
        super.init(nibName: FirstContainerController.typeName, bundle: Bundle.main)
    }
    required init?(coder: NSCoder) {
        fatalError("Use init(review:")
    }
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    
    @objc func sliderValueChanged(_ sender: RateQuestionSlider) {
        
        let rateValue = Int(sender.index + 1)
        guard let questionRawValue = sender.accessibilityIdentifier else { fatalError() }
        guard let question = RateQuestion(rawValue: questionRawValue) else { fatalError() }
        
        // Update model
        review.update(with: rateValue, forQuestion: question)
        
        // Update view
        guard let questionView = findQuestionView(byID: questionRawValue) else { fatalError() }
        guard let rate = Rate(rawValue: rateValue) else { fatalError() }
        let emoji = emoji(for: rate)
        questionView.rateLabel.text = emoji
    }
    
    // MARK: - Help Handlers
    
    private func setupView() {
        // Setup title
        titleLabel.text = Constants.title
        
        // Setup question views
        for (index, questionView) in questionViews.enumerated() {
            let question = RateQuestion.allCases[index]
            let startRate = Constants.startRate
            let emoji = emoji(for: startRate)
            questionView.questionLabel.text = question.title
            questionView.rateLabel.text = emoji
            
            // Setup slider
            questionView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
                        
            // Set identifiers to distinguish views
            let identifier = question.rawValue
            questionView.accessibilityIdentifier = identifier
            questionView.slider.accessibilityIdentifier = identifier
        }
    }
    private func emoji(for rate: Rate) -> String {
        switch rate {
        case .awful: return Constants.Emoji.awful
        case .bad: return Constants.Emoji.bad
        case .ok: return Constants.Emoji.ok
        case .good: return Constants.Emoji.good
        case .awesome: return Constants.Emoji.awesome
        }
    }
    private func findQuestionView(byID id: String) -> RateQuestionView? {
        for questionView in questionViews {
            if questionView.accessibilityIdentifier == id {
                return questionView
            }
        }
        return nil
    }
    
    // MARK: - Wrapping Controller DataSource
    
    let callToActionButtonTitle = Constants.callToActionButtonTitle
    let cancelButtonTitle = Constants.cancelButtonTitle
    
    func callToActionButtonTapped() {
        let secondContainer = SecondContainerController(review: review)
        let secondScreen = WrappingController(containerVC: secondContainer, dataSource: secondContainer)
        secondScreen.modalPresentationStyle = .formSheet
        present(secondScreen, animated: true, completion: nil)
    }
    
    func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Constants
    
    enum Constants {
    
        static let startRate: Rate = .ok
        static let callToActionButtonTitle = "Далее"
        static let cancelButtonTitle = "Не хочу отвечать"
        static let title = "Офигенно, вы дошли до конца! Расскажите, как вам?"
        
        enum Emoji {
            static let awful = "😡"
            static let bad = "🙁"
            static let ok = "😐"
            static let good = "🙂"
            static let awesome = "😁"
        }
        
    }
}
