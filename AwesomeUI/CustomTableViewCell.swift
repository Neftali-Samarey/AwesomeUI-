//
//  CustomTableViewCell.swift
//  AwesomeUI
//
//  Created by Neftali Samarey on 4/12/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var cellLabel = UILabel()
    var cellIcon = UIImageView() // Imageview not in use currently

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellLabel.frame = CGRect(x: 10, y: 13, width: Int(super.bounds.size.width), height: 30)
        self.cellLabel.font = UIFont(name: "MuseoSansRounded-500", size: 20)
        self.cellLabel.textColor = UIColor.dracularDark()
        
        self.addSubview(cellLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
