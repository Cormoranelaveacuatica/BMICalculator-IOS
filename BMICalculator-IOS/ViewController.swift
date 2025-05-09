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
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var weight = 60
    var height = 170
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onHeigthChanger(_ sender: UISlider) {
        let value = Int(sender.value)
        heightLabel.text = "\(value) cm"
    }
    @IBAction func onWeightChanger(_ sender: UIStepper) {
        let value = Int(sender.value)
        weightLabel.text = "\(value) kg"
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        let result = Float(weight) / pow((Float(height) / 100.0), 2)
        resultLabel.text = String(format: "%.2f", result)
        
        var color = UIColor.black
        var description = ""
        var showAlert = false
        switch (result) {
        case 0.0..<18.5:
                    color = UIColor(named: "bmi_underweight")!
                    description = "Bajo peso"
                case 18.5..<25:
                    color = UIColor(named: "bmi_normal_weight")!
                    description = "Peso normal"
                case 25..<30:
                    color = UIColor(named: "bmi_overweight")!
                    description = "Sobrepeso"
                case 30..<35:
                    color = UIColor(named: "bmi_obesity")!
                    description = "Obesidad"
                    showAlert = true
                default:
                    color = UIColor(named: "bmi_extreme_obesity")!
                    description = "Obesidad morbida"
                    showAlert = true
                }
                
                descriptionLabel.text = description
                
                resultLabel.textColor = color
                descriptionLabel.textColor = color
                
                if (showAlert) {
                    let alert = UIAlertController(
                        title: "Riesgo de salud",
                        message: "Tu peso actual pone en grave riesgo tu vida. Busca ayuda médica cuanto antes.",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                        // He pulsado mas información
                        let adviceSiteUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
                        if let url = URL(string: adviceSiteUrl), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }))
                    alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
    }
}

