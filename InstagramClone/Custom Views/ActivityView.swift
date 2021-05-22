//
//  ActivityView.swift
//  InstagramClone
//
//  Created by joel Alcantara on 21/5/21.
//

import UIKit

class ActivityView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityTableView: UITableView!
    
    var activityData: [Activity] = [] {
        didSet {
            activityTableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        activityTableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
        activityTableView.delegate = self
        activityTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        cell.profileImage.image = activityData[indexPath.row].userImage
        cell.detailLabel.text = activityData[indexPath.row].details
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
