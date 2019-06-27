//
//  CourseViewController.swift
//  Navbar Glitch
//
//  Created by Erick Harris on 6/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var courseContentTableView: UITableView!
    @IBOutlet weak var tabBarView: UIView!
    
    // Dummy table view data
    var cells: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    var numberOfCells = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Root View
        view.backgroundColor = .gray
        
        // Navigation Bar
        navigationItem.title = "Course Title"
        navigationController?.view.backgroundColor = .white
        if let nav = navigationController?.navigationBar {
            nav.isTranslucent = false
            nav.prefersLargeTitles = true
        }
        
        // Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        let searchBar = searchController.searchBar
        searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Add view behind searchBar to cover up weird ui effect during transmission
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: -80, width: searchBar.bounds.width, height: 80)
        searchBar.addSubview(view)
        searchBar.sendSubviewToBack(view)
        
        // Progress Bar
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .blue
        progressView.progress = 0.50
        
        // Table View
        courseContentTableView.delegate = self
        courseContentTableView.dataSource = self
        courseContentTableView.backgroundColor = .lightGray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as! CustomTableViewCell
        cell.label.text = cells[indexPath.row]
        cell.backgroundColor = .yellow
        cell.selectionStyle = .none
        return cell
    }
}
