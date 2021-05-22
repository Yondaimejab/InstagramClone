//
//  ActivityTableViewCell.swift
//  InstagramClone
//
//  Created by joel Alcantara on 21/5/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.masksToBounds = true
        selectionStyle = .none
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImage.layer.cornerRadius = 10.0
    }
}
