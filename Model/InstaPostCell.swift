//
//  InstaPostCell.swift
//  InstaClone
//
//  Created by Jacob Frick on 10/5/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class InstaPostCell: UITableViewCell {

    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
