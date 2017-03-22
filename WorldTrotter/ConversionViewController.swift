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
    @IBOutlet var textField: UITextField!
    
    
    @IBAction func fahreheitFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }

    
    @IBAction func dismissKeyboard(_ sener: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
}
