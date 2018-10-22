//
//  FinishGoalVC.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/21/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit
import CoreData
class FinishGoalVC: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var goalButton: UIButton!
    
    @IBOutlet weak var pointsTextFild: UITextField!
    
    
    var goldDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsTextFild.delegate = self
        goalButton.bindToKeyboard()
         print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }

    func initData(description: String, type: GoalType) {
        self.goldDescription = description
        self.goalType = type
        
    }
   
    @IBAction func createGoalbtn(_ sender: UIButton) {
        if pointsTextFild.text != "" {
            self.save()
            dismiss(animated: true, completion: nil)
        }
       
    }
   
    
   
    @IBAction func goBack(_ sender: UIButton) {
        dismissDetail()
    }
    
    
    
    func save() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
         let goal = Goal(context: managedContext)
        goal.goalDescription = goldDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextFild.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("Data is saved")
        }catch{
            print("Could not save data")
        }
    }

}
