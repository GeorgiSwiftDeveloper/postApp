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
    
    
    func configureCell(description: String, type: GoalType, progress: Int) {
        self.goalDescribLbl.text = description
        self.goalTypeLbl.text = type.rawValue
        self.goalProressLbl.text = String(progress)
    }
}
