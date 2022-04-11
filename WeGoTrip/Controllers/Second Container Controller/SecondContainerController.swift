//
//  SecondContainerController.swift
//  WeGoTrip
//
//  Created by admin on 10.04.2022.
//

import UIKit

class SecondContainerController: UIViewController, Describable, WrappingControllerDataSource, UITextViewDelegate {
    
    // MARK: - Properties
    
    private var review: Review
    
    // MARK: - Outlets
    
    @IBOutlet private var questionViews: [TextQuestionView]!
    @IBOutlet var activityIndicatorView: ActivityIndicatorView!
    
    // MARK: - Init
    
    init(review: Review) {
        self.review = review
        super.init(nibName: SecondContainerController.typeName, bundle: Bundle.main)
    }
    required init?(coder: NSCoder) {
        fatalError("Use init(review:")
    }
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Help Handlers
    
    private func setupView() {
        for (index, questionView) in questionViews.enumerated() {
            
            let question = TextQuestion.allCases[index]
            
            questionView.questionLabel.text = question.title
            questionView.answerTextView.placeholderLabel.text = question.placeholder
            questionView.answerTextView.delegate = self
            
            // Set identifier to distinguish views
            let identifier = question.rawValue
            questionView.accessibilityIdentifier = identifier
            
            activityIndicatorView.isHidden = true
        }
    }
    
    private func reviewSavingSuccess() {
        let message = "Спасибо за ваш отзыв!"
        showAlert(withMessage: message, actionHandler: dismiss)
    }
    
    private func reviewSavingError() {
        let message = "Что-то пошло не так :("
        showAlert(withMessage: message, actionHandler: nil)
    }
    
    func dismiss(_ alert: UIAlertAction) {
        cancelButtonTapped()
    }
    
    private func showAlert(withMessage message: String, actionHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: actionHandler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - TextView Delegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Update placeholder
        let currentText = textView.text
        let updatedText = (currentText as! NSString).replacingCharacters(in: range, with: text)
        
        let textView = textView as! TextViewWithPlaceholder
        updatedText.isEmpty ? textView.showPlaceholder() : textView.hidePlacehoder()
        
        return true
    }
    
    // MARK: - Wrapping Controller DataSource
    
    let callToActionButtonTitle = Constants.callToActionButtonTitle
    let cancelButtonTitle = Constants.cancelButtonTitle
    
    func callToActionButtonTapped() {
        
        activityIndicatorView.start()
        
        // Update model
        for questionView in questionViews {
            let answer = questionView.answerTextView.text ?? ""
            guard let identifier = questionView.accessibilityIdentifier else { fatalError() }
            guard let question = TextQuestion(rawValue: identifier) else { fatalError() }
            review.update(with: answer, forQuestion: question)
        }
        
        // Save model
        NetworkManager.shared.sendReview(review) { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    // Show error
                    self?.reviewSavingError()
                }
                else {
                    // Show success message
                    self?.reviewSavingSuccess()
                }
                self?.activityIndicatorView.stop()
            }
        }
    }
    func cancelButtonTapped() {
        dismiss(animated: true)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Constants
    
    enum Constants {
        static let callToActionButtonTitle = "Сохранить отзыв"
        static let cancelButtonTitle = "Пропустить"
    }
}
