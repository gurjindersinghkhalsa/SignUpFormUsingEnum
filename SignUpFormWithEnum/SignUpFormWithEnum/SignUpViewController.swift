//
//  ViewController.swift
//  SignUpFormWithEnum
//
//  Created by Gurjinder Singh on 12/09/18.
//  Copyright © 2018 TA. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var footerView: UIView!
  @IBOutlet weak var tblViewSignUP: UITableView!

  var formData = [SignUpFormData]()
  var user = User()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tblViewSignUP.dataSource = self
    formData = SignUpFormData.arraySignUpFrom
    SignUpFormData.user = user
    
  }

  @IBAction func tapSignUp(_ sender: Any) {
      print("You Name is \(user.userName)")
    print("You password is \(user.password)")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension SignUpViewController {
  @objc func valueChange(_ textField: UITextField) {
    if textField.tag == 0 {
      user.userName = textField.text!
    } else {
      user.password = textField.text!
    }
  }
}

extension SignUpViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return formData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellSignUp", for: indexPath) as? cellSignUp else { return UITableViewCell() }
    let object = formData[indexPath.row]
    cell.lblHeading.text = object.labelPlaceHolder
    cell.txtFieldInput.keyboardType = object.keyBoardType
    cell.txtFieldInput.tag = indexPath.row
    cell.txtFieldInput.isSecureTextEntry = object.secureTextEntry
    cell.txtFieldInput.placeholder = object.textFieldPlaceHolder
    cell.txtFieldInput.addTarget(self, action: #selector(valueChange(_:)), for: .editingChanged)
    return cell
  }
}

