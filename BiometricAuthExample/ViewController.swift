//
//  ViewController.swift
//  BiometricAuthExample
//
//  Created by Vishwas on 25/05/18.
//  Copyright © 2018 Vishwas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var evalutionLabel: UILabel!
    @IBOutlet weak var buttonAuthType: UIButton!
    @IBOutlet weak var buttonEvaluateAuth: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAuthTypeAction(_ sender: UIButton)
    {
        let value:BioMetricSupported = visAuthClass.supportedBiometricType()
        if (value == .none)
        {
            evalutionLabel.textColor = UIColor.red
            evalutionLabel.text = value.rawValue
        }
        else
        {
            evalutionLabel.textColor = UIColor.green
            evalutionLabel.text = value.rawValue
        }
        
    }
    
    @IBAction func buttonEvaluateAuthAction(_ sender: UIButton)
    {
        evalutionLabel.textColor = UIColor.black
        evalutionLabel.text = "evaluating........."
        visAuthClass.isValidUer(reasonString: "BioMetric Authentication Demo") {[unowned self] (isSuccess, stringValue) in
            
            if isSuccess
            {
                self.evalutionLabel.textColor = UIColor.green
                self.evalutionLabel.text = "evaluating...... successfully completed"
            }
            else
            {
                self.evalutionLabel.textColor = UIColor.red
                self.evalutionLabel.text = "evaluating...... failed to recognise user \n reason = \(stringValue?.description ?? "invalid")"
            }
            
        }
    }
}

