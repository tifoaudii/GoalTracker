//
//  AddGoalViewController.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 25/04/22.
//

import UIKit

class AddGoalViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sliderDidChange(_ sender: Any) {
        sliderValue.text = "\(Int(slider.value))"
    }
    
    
    @IBAction func createButtonDidTapped(_ sender: Any) {
    }
}
