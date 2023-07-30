//
//  ViewController.swift
//  SelfHealth
//
//  Created by Belinda Wong on 17/7/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cardTableView: UITableView!

//    let pictures: [UIImage] = [UIImage(named: "beach.jpg")!, UIImage(named: "mountain.jpg")!, UIImage(named: "desert.jpg")!, UIImage(named: "beach.jpg")!]
    let titles: [String] = ["🌟 Current Hypothesis", "📌 Today's Action", "📊 Analysis", "📝 Experiment Results"]
    let descriptions: [String] = ["Does increased step count lead to better quality sleep?", "Exceed daily long-term average of 7,894 steps.", "So far, you seem to sleep better when you are exceeding your average daily step count.", "These are the results for your ongoing experiment."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// How many rows in the tableview?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    /// Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
//
//        cell.configure(picture: pictures[indexPath.row], title: titles[indexPath.row], description: descriptions[indexPath.row])
        cell.configure(title: titles[indexPath.row], description: descriptions[indexPath.row])
        
        return cell
    }
}
