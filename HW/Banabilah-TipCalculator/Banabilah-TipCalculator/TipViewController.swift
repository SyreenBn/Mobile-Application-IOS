//
//  TipViewController.swift
//  Banabilah-TipCalculator
//
//  Created by Syreen Banabilah on 3/12/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {
    let defaultDecimal = 0.00
    var convertedBillAmount : Double?
    var convertedTipPercentage : Double?
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var total: UILabel!
    //var calculat = TipCalculator(bill: billAmount.text, tip: tipPercentage.text)
    
    @IBAction func calculateTip(_ sender: Any) {
        convertedBillAmount = Double(billAmount.text!) ?? defaultDecimal
        convertedTipPercentage = Double(tipPercentage.text!) ?? defaultDecimal
        let C = TipCalculator(bill: convertedBillAmount!, tip: convertedTipPercentage!)
        self.tipAmount.text! = String(format:"Tip Amount: $ %.2f", C.tipAmount)
        self.total.text! = String(format:"Total: $ %.2f", C.total)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billAmount.keyboardType = UIKeyboardType.decimalPad
        self.tipPercentage.keyboardType = UIKeyboardType.decimalPad
        
        self.billAmount.delegate = self
        self.tipPercentage.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //note that the use of textField here instead of text1, text2, or text3 means that this will work for any of the text fields on the screen
        return true
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
   
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
