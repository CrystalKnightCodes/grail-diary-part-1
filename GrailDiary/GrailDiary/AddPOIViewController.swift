//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Christy Hicks on 9/27/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var poiDelegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
        @IBAction func cancelAddPOI(_ sender: UIBarButtonItem) {
            dismiss(animated: true, completion: nil)
        }
        
        @IBAction func saveNewPOI(_ sender: UIBarButtonItem) {
            guard let location = locationTextField.text, !location.isEmpty, let country = countryTextField.text, !country.isEmpty else { return }
            
            var place = POI(location: location, country: country)
            
            if let clue1 = clue1TextField.text, !clue1.isEmpty {
                       place.clues.append(clue1)
                   }
            if let clue2 = clue2TextField.text, !clue2.isEmpty {
                place.clues.append(clue2)
            }
            if let clue3 = clue3TextField.text, !clue3.isEmpty {
                place.clues.append(clue3)
            }
            poiDelegate?.poiWasAdded(place)
            dismiss(animated: true, completion: nil)
        }
}

  
// MARK: - Text Field Delegate
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        } else {
            view.endEditing(false)
        }
        
        return false
    }
    
}
