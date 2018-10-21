//
//  FinishGoalVC.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/21/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var GoalBtn: UIButton!
    
    @IBOutlet weak var pointsTextFild: UITextField!
    
    
    var goldDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsTextFild.delegate = self
        GoalBtn.bindToKeyboard()
    }

    func initData(description: String, type: GoalType) {
        self.goldDescription = description
        self.goalType = type
        
    }
   
    @IBAction func createGoalBtn(_ sender: UIButton) {
    }
    
}
