//
//  ViewController.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/19/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? GoalCell
        cell?.configureCell(description: "Eat salad 2 a week", type: .shortTerm, progress: 2)
        return cell!
    }
    
    
}
