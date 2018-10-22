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


