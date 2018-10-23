//
//  ViewController.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/19/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                fetchRequest()
    }
    
    func fetchRequest() {
        self.fetch { (comlition) in
            if comlition {
                if goals.count >= 1 {
                    myTableView.isHidden = false
                }else {
                    myTableView.isHidden = true
                }
            }
        }
    }
    

    @IBAction func myGoalButton(_ sender: UIButton) {
        let creatGoalVc = storyboard?.instantiateViewController(withIdentifier: "CreatGoalVC")
        presentDetal(creatGoalVc!)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? GoalCell else {return UITableViewCell() }
        
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.remove(atIndexPath: indexPath)
            self.fetchRequest()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.set(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        addAction.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        deletAction.backgroundColor = #colorLiteral(red: 0.9597076413, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        return [deletAction, addAction]
    }
    
    
    
    
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard    let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        
        do{
            goals = try managedContext.fetch(request)
            print("Succsesfuly")
            completion(true)
        }catch{
            print("Error")
            completion(false)
        }
        
    }
}


extension GoalsVC {
    
    func set(atIndexPath indexPath: IndexPath) {
        guard let managedContex = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else {
            return
        }
        do {
            try managedContex.save()
            print("Succsessfuly set progress")
        }catch {
            print("could not save \(error.localizedDescription)")
        }
    }
    
    func remove(atIndexPath indexPaty: IndexPath ) {
        guard let managedContex = appDelegate?.persistentContainer.viewContext else {return}
        managedContex.delete(goals[indexPaty.row])
        
        do{
            try managedContex.save()
        }catch {
            print("Could not remove \(error.localizedDescription)")
        }
    }
}
