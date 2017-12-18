//
//  GSSearchCell.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSSearchCell: UITableViewCell {

    @IBOutlet weak var userLoginNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(user:User) {
        self.userLoginNameLabel.text = user.loginName
        self.userImageView.sd_setShowActivityIndicatorView(true)
        self.userImageView.sd_setIndicatorStyle(.white)
        self.userImageView.sd_setImage(with: URL(string:user.avatar), placeholderImage: Constants.placeHolderImage)
    }
    
}
