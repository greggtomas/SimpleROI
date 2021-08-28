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
    
    @IBOutlet weak var invGainsAmt: UILabel!
    @IBOutlet weak var roi: UILabel!
    @IBOutlet weak var annualRoi: UILabel!
    @IBOutlet weak var invLength: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        invGainsAmt.isHidden = true
        roi.isHidden = true
        annualRoi.isHidden = true
        invLength.isHidden = true
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        getResults()
    }
    
    private func getResults(){
        let soldPrice = Int(soldPriceTextField.text!) ?? 0
        let shippingFee = Int(shippingFeeTextField.text!) ?? 0
        let labelFee = Int(labelFeeTextField.text!) ?? 0
        let otherFee = Int(otherFeesTextField.text!) ?? 0
        
        let roi = soldPrice - shippingFee - labelFee - otherFee
        resultsDisplay.text = "\(roi)"
    }
    
}

