//
//  DashboardViewController.swift
//  Navbar Glitch
//
//  Created by Erick Harris on 6/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var dashboardTableView: UITableView!
    
    let refresh = UIRefreshControl()
    
    // Dummy table view data
    var cells: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    var numberOfCells = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Root View
        view.backgroundColor = .gray
        
        // Navigation Bar
        navigationItem.title = "Dashboard"
        navigationController?.view.backgroundColor = .white
        if let nav = navigationController?.navigationBar {
            nav.isTranslucent = false
            nav.prefersLargeTitles = true
        }
        
        // Search Bar
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        let searchBar = searchController.searchBar
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Table Views
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        dashboardTableView.backgroundColor = .lightGray
        // Get Section Headers to Scroll
        dashboardTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: dashboardTableView.bounds.size.width, height: CGFloat(40)))
        dashboardTableView.contentInset = UIEdgeInsets(top: -CGFloat(40), left: 0, bottom: 0, right: 0)
        
        // Refresh Control
        self.extendedLayoutIncludesOpaqueBars = true
        refresh.addTarget(self, action: #selector(refreshDasboard), for: .valueChanged)
        dashboardTableView.refreshControl = refresh
    }
    
    @objc func refreshDasboard() {
        numberOfCells += 1
        cells.append("\(numberOfCells)")
        
        dashboardTableView.reloadData()
        refresh.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as! CustomTableViewCell
        cell.label.text = cells[indexPath.row]
        cell.backgroundColor = .red
        cell.selectionStyle = .none
        return cell
    }
}


