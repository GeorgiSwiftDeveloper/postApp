//
//  TableViewCellControllerTableViewCell.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/19/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

        
    @IBOutlet weak var goalDescribLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProressLbl: UILabel!
    
    @IBOutlet weak var comletionView: UIView!
    
    func configureCell(goal: Goal) {
        self.goalDescribLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.comletionView.isHidden = false
        }else {
           self.comletionView.isHidden = true
        }
    }
}
