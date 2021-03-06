//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Shen Xiaochun on 2017/3/22.
//  Copyright © 2017年 Sigutian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    
    @IBAction func fahreheitFieldEditingChanged(_ textField: UITextField) {
        
//        if let text = textField.text, let value = Double(text) {
//            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        
        } else {
            fahrenheitValue = nil
        }
        

        
    }

    
    @IBAction func dismissKeyboard(_ sener: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
            
            
            
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        
        
        var validTextFieldInput = NSCharacterSet.decimalDigits
        validTextFieldInput.insert(".")
        
        let replacementTextIsOnlyNumbers = string.rangeOfCharacter(from: validTextFieldInput)
        
        if string == "" {
            return true
        } else {
        

            if replacementTextIsOnlyNumbers != nil {
                if existingTextHasDecimalSeparator != nil,
                    replacementTextHasDecimalSeparator != nil {
                    return false
                }
                return true
            }
            return false
    }
    
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        
        let hour = Calendar.current.component(.hour, from: date)
        
        if hour > 18 || hour < 6  {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
}
