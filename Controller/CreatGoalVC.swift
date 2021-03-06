//
//  CreatGoalVCViewController.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/19/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit

class CreatGoalVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var shortButton: UIButton!
    
    @IBOutlet weak var longButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        
        nextBtn.bindToKeyboard()
        
        shortButton.setSelectedColor()
        longButton.setDeslectedColor()
    }
    
 
  
   
    @IBAction func nextBtnPress(_ sender: UIButton) {
        if goalTextView.text != "" && goalTextView.text != "What is GOAL ?" {
            guard   let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "goalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextView.text
                , type: goalType)
            presentingViewController?.presentSecondVC(finishGoalVC)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func shortBtnPress(_ sender: UIButton) {
        goalType = .shortTerm
        shortButton.setSelectedColor()
        longButton.setDeslectedColor()
    }
    
    @IBAction func longBtnPress(_ sender: UIButton) {
        goalType = .shortTerm
        longButton.setSelectedColor()
        shortButton.setDeslectedColor()
    }
    
    @IBAction func backButtonPress(_ sender: UIButton) {
            dismissDetail()
    }
    
}

