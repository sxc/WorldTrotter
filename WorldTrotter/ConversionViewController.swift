//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Shen Xiaochun on 2017/3/22.
//  Copyright © 2017年 Sigutian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahreheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text 
        
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
}
