//
//  StarWarsViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Brendon Cecilio on 12/2/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var starWars = [StarWarsMovie]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let StarWarsDetailController = segue.destination as? StarWarsDetailController, let indextPath = tableView.indexPathForSelectedRow else {
            return
        }
        StarWarsDetailController.descriptionCrawl = starWars[indextPath.row]
    }
    
    func loadData() {
        starWars = StarWarsData.getMovieInfo(from: Data.init())
    }
}

extension StarWarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        
        let movieCell = starWars[indexPath.row]
        cell.textLabel?.text = movieCell.title
        return cell
    }
    
    
}
