//
//  ViewController.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 14/04/22.
//

import UIKit

class GoalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackerCell.identifier, for: indexPath) as? TrackerCell else {
            return UITableViewCell()
        }
        
        cell.goalTitle.text = "Masak Air"
        cell.onTapGoalButton = {
            self.performSegue(withIdentifier: "AddGoalSegue", sender: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

