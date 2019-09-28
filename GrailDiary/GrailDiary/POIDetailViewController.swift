//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Christy Hicks on 9/27/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI? {
         didSet {
                   updateViews()
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    private func updateViews() {
        guard let aPoint = poi else { return }
        locationLabel.text = aPoint.location
        countryLabel.text = aPoint.country
        cluesTextView.text = "\(aPoint.clues)"
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
