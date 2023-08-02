//
//  ViewController.swift
//  NeonAcademyUserDefaults
//
//  Created by Kerem Caan on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var switchState: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperLabel.text = String(defaults.object(forKey: "manyTimesVisited") as? Int ?? 0)
        textField.text = defaults.object(forKey: "placeName") as? String
        switchState.isOn = defaults.object(forKey: "isVisited") as? Bool ?? false
        stepper.value = Double(defaults.object(forKey: "manyTimesVisited") as? Double ?? 0)
        }

    let defaults = UserDefaults.standard
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = sender.value
        stepperLabel.text = "\(Int(stepperValue))"
    }
    @IBAction func saveButton(_ sender: UIButton) {
        defaults.set(switchState.isOn, forKey: "isVisited")
        defaults.set(textField.text, forKey: "placeName")
        defaults.set(Int(stepperLabel.text!), forKey: "manyTimesVisited")
    }
    
    
}

