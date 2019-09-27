//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Christy Hicks on 9/22/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
        
    @IBOutlet weak var pointTableView: UITableView!
    
    var points: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "AddPOIModalSegue":
        guard let addPOIVC = segue.destination as? AddPOIViewController else { fatalError() }
        
        addPOIVC.poiDelegate = self
       /*
    case "ShowPOIDetailSegue":
        guard let indexPath = pointTableView.indexPathForSelectedRow,
            let POIDetailVC = segue.destination as? POIDetailViewController else { fatalError() }
        
        POIDetailVC = points[indexPath.row] */
    default:
        fatalError("An unknown segue was encountered: \(segue.identifier ?? "<No ID>")")
    }
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
      // FIXME: This attempt to reloadData says that tableView is ambiguous at numberOfRowsInSection
        pointTableView.reloadData()
        
    }
    
    
}
