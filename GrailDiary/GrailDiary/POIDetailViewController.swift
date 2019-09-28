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
    }
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText: [String] = []
        for clue in poi.clues {
            clueText.append("\(clue?.description ?? "")\n")
        }
        cluesTextView.text = "\(clueText[0])\n\(clueText[1])\n\(clueText[2])"
    }

}
