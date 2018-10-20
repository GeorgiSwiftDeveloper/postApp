//
//  ButtonExt.swift
//  goal-app
//
//  Created by Georgi Malkhasyan on 10/19/18.
//  Copyright © 2018 Adamyan. All rights reserved.
//

import UIKit


extension UIButton {
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.6666666667, blue: 0.168627451, alpha: 0.7193371357)
    }
    
    func setDeslectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.537254902, green: 0.8980392157, blue: 0.3607843137, alpha: 1)
    }
}
