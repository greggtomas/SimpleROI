//
//  ViewController.swift
//  SimpleROI
//
//  Created by Gregg Tomas on 8/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var soldPriceTextField: UITextField!
    @IBOutlet weak var shippingFeeTextField: UITextField!
    @IBOutlet weak var labelFeeTextField: UITextField!
    @IBOutlet weak var otherFeesTextField: UITextField!
    @IBOutlet weak var resultsDisplay: UILabel!
    
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBOutlet weak var invGainsAmt: UILabel!
    @IBOutlet weak var roi: UILabel!
    @IBOutlet weak var annualRoi: UILabel!
    @IBOutlet weak var invLength: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        invGainsAmt.isHidden = true
        roi.isHidden = true
        annualRoi.isHidden = true
        invLength.isHidden = true
        view.sendSubviewToBack(background)
        setButtonCharacteristics()
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        getResults()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        soldPriceTextField.text = ""
        shippingFeeTextField.text = ""
        labelFeeTextField.text = ""
        otherFeesTextField.text = ""
    }
    
    private func setButtonCharacteristics(){
        calculateBtn.layer.cornerRadius = 5
        calculateBtn.backgroundColor = .systemBlue
        clearBtn.layer.cornerRadius = 5
        clearBtn.backgroundColor = .systemBlue
    }
    
    private func getResults(){
        let soldPrice = Double(soldPriceTextField.text!) ?? 0
        let shippingFee = Double(shippingFeeTextField.text!) ?? 0
        let labelFee = Double(labelFeeTextField.text!) ?? 0
        let otherFee = Double(otherFeesTextField.text!) ?? 0
        
        let roiAmt = round((soldPrice - shippingFee - labelFee - otherFee) * 100)/100.0

        if (roiAmt > 0 ){
            invGainsAmt.textColor = UIColor(red: 0, green: 0.5765, blue: 0.1412, alpha: 1.0)
        }else{
            invGainsAmt.textColor = UIColor.red
        }
        
        invGainsAmt.isHidden = false
        invGainsAmt.lineBreakMode = .byClipping // removes the elipse
        
        invGainsAmt.text = "$\(roiAmt)"
        
    }
    
}

