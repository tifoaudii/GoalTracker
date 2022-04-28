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
    
    var didAddNewGoal: ((Goal) -> Void)?
    
    var coreData: CoreDataStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue.text = "0"
    }
    

    @IBAction func sliderDidChange(_ sender: Any) {
        sliderValue.text = "\(Int(slider.value))"
    }
    
    
    @IBAction func createButtonDidTapped(_ sender: Any) {
        guard let goalTitle = titleTextField.text, !goalTitle.isEmpty else {
            return
        }
        
        guard let goalDesc = descTextView.text, !goalDesc.isEmpty else {
            return
        }
        
        let goal = Goal(context: coreData.viewContext)
        goal.title = goalTitle
        goal.currentProgress = 0
        goal.desc = goalDesc
        goal.totalProgress = Int64(slider.value)
        coreData.save()
        navigationController?.popViewController(animated: true)
        didAddNewGoal?(goal)
    }
}
