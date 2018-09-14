//
//  cellSignUp.swift
//  SignUpFormWithEnum
//
//  Created by Gurjinder Singh on 12/09/18.
//  Copyright © 2018 TA. All rights reserved.
//

import UIKit

protocol FormCellDelegate: class {
  func textFieldValueChanged(value: String, formData: SignUpFormData)
}

protocol ReuseableView: class {
  static var defaultReuseIdentifier: String { get }
  static var nib: UINib? { get }
}

extension ReuseableView where Self: UIView {
  static var nib: UINib? { return nil }
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

class cellSignUp: UITableViewCell, ReuseableView {

  weak var delege: FormCellDelegate?
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
  
  var formData: SignUpFormData? {
    didSet {
      if let formData = formData {
        configureCell(formData: formData)
      }
    }
  }
  
  func configureCell(formData: SignUpFormData) {
    lblHeading.text = formData.labelPlaceHolder
    txtFieldInput.keyboardType = formData.keyBoardType
    txtFieldInput.isSecureTextEntry = formData.secureTextEntry
    txtFieldInput.placeholder = formData.textFieldPlaceHolder
    txtFieldInput.addTarget(self, action: #selector(valueChange(_:)), for: .editingChanged)
    txtFieldInput.delegate = self
  }
  
  @objc func valueChange(_ textField: UITextField) {
    if let delegate = self.delege, let formData = self.formData, let text = textField.text {
      delegate.textFieldValueChanged(value: text, formData: formData)
    }
  }
}

extension cellSignUp: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
