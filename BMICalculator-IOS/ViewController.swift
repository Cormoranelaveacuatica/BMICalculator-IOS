//
//  ViewController.swift
//  BMICalculator-IOS
//
//  Created by Mañanas on 5/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onHeigthChanger(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func onWeightChanger(_ sender: UIStepper) {
        let value = Int(sender.value)
        weightLabel.text = "\(value) kg"
        print(sender.value)
    }
    
}

