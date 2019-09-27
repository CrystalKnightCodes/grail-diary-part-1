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
