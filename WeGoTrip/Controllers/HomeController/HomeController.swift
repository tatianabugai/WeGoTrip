//
//  ViewController.swift
//  WeGoTrip
//
//  Created by admin on 07.04.2022.
//

import UIKit

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tbuttonTapped(_ sender: UIButton) {
        let tourID = UUID()
        let review = Review(tourID: tourID)
        let firstContainer = FirstContainerController(review: review)
        let firstScreen = WrappingController(containerVC: firstContainer, dataSource: firstContainer)
        firstScreen.modalPresentationStyle = .formSheet
        present(firstScreen, animated: true, completion: nil)
    }
}

