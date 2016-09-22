//
//  ItemCell.swift
//  Todo
//
//  Created by Shawn Wu on 12/09/16.
//  Copyright © 2016 Spark. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    lazy var dataFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellWithItem(_ item: ToDoItem,
                            checked: Bool = false) {
        
        if checked {
            let attributedTitle = NSAttributedString(string: item.title,
                                                     attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
            
            titleLabel.attributedText = attributedTitle
            locationLabel.text = nil
            dateLabel.text = nil
        } else {
            titleLabel.text = item.title
            locationLabel.text = item.location?.name
            
            if let timestamp = item.timeStamp {
                let date = Date(timeIntervalSince1970: timestamp)
                
                dateLabel.text = dataFormatter.string(from: date)
            }
        }
    }

}
