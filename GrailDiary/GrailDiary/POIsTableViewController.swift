//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Christy Hicks on 9/22/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var points: [POI] = []
        
    @IBOutlet weak var pointTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

// MARK: Table View Data Source
extension POIsTableViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return points.count
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError() }
    
   let point = points[indexPath.row]
    cell.poi = point
    
    return cell
    }

}

// MARK: Connect to AddPOIView
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        points.append(poi)
        dismiss(animated: true, completion: nil)
       // tableView.reloadData()
        
    }
    
    
}
