//
//  GSProfileHeaderTableCell.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import SDWebImage

class GSProfileHeaderTableCell: UITableViewCell {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImageView.layer.cornerRadius = self.userImageView.frame.width/2
        self.userImageView.clipsToBounds = true
    }
    
    func setup(user:User) {
        self.locationLabel.text = user.location
        self.nameLabel.text = user.name
        if let date = Date.makeDate(dateString: user.updatedAt) {
            let dateString = Date.makeDateStringLocal(date: date)
            self.lastUpdateLabel.text = "Last Updated \n\(dateString)"
        }
        self.userImageView.sd_setShowActivityIndicatorView(true)
        self.userImageView.sd_setIndicatorStyle(.white)
        self.userImageView.sd_setImage(with: URL(string:user.avatar), placeholderImage: Constants.placeHolderImage)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
