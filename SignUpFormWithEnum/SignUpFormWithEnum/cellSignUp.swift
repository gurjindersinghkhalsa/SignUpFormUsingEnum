//
//  cellSignUp.swift
//  SignUpFormWithEnum
//
//  Created by Gurjinder Singh on 12/09/18.
//  Copyright © 2018 TA. All rights reserved.
//

import UIKit

class cellSignUp: UITableViewCell {
  
  static func reuseIdentifier() -> String {
      return String(describing: self)
  }
  
  @IBOutlet weak var lblHeading: UILabel!
  
  @IBOutlet weak var txtFieldInput: UITextField!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
