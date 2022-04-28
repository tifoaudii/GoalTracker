//
//  TrackerCell.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 14/04/22.
//

import UIKit

final class TrackerCell: UITableViewCell {
    
    static var identifier: String = "TrackerCell"
    
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalDesc: UILabel!
    @IBOutlet weak var totalGoal: UILabel!
    @IBOutlet weak var currentGoal: UILabel!
    
    var addProgress: (() -> Void)?
    var substractProgress: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction private func substractGoal(_ sender: Any) {
        substractProgress?()
    }
    
    @IBAction private func addGoal(_ sender: Any) {
        addProgress?()
    }
}
