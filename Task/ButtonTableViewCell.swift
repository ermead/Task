//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Eric Mead on 10/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var primaryLabel: UILabel!
    
    var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonTapped(sender: UIButton) {
    
        delegate?.buttonCellButtonTapped(self)

    }
    
    func upDateButton(isComplete: Bool){
        if isComplete {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
       
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ButtonTableViewCell {
    
    func updateWithTask (task: Task) {
        primaryLabel.text = task.name
        upDateButton(task.isComplete)
    }
    
}
