//
//  ViewController.swift
//  GoalTracker
//
//  Created by Tifo Audi Alif Putra on 14/04/22.
//

import UIKit

class GoalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let coreData = CoreDataStack()
    
    private var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.rightBarButtonItem = .init(image: .add, style: .plain, target: self, action: #selector(didTapLeftBarButton))
        
        let request = Goal.fetchRequest()
        
        do {
            goals = try coreData.viewContext.fetch(request)
            tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? AddGoalViewController else {
            return
        }
        viewController.coreData = coreData
        viewController.didAddNewGoal = { goal in
            self.goals.append(goal)
            self.tableView.reloadData()
        }
    }
    
    @objc private func didTapLeftBarButton() {
        performSegue(withIdentifier: "AddGoalSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackerCell.identifier, for: indexPath) as? TrackerCell else {
            return UITableViewCell()
        }
        
        let goal = goals[indexPath.row]
        cell.goalTitle.text = goal.title ?? ""
        cell.goalDesc.text = goal.desc ?? ""
        cell.currentGoal.text = "\(goal.currentProgress)"
        cell.totalGoal.text = "\(goal.totalProgress)"
        cell.addProgress = {
            if goal.currentProgress + 1 == goal.totalProgress {
                self.coreData.viewContext.delete(goal)
                self.coreData.save()
                self.goals.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                let newProgress = goal.currentProgress + 1
                goal.currentProgress = newProgress
                self.coreData.save()
                self.tableView.reloadData()
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

