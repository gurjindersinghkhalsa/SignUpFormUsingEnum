//
//  ViewController.swift
//  SignUpFormWithEnum
//
//  Created by Gurjinder Singh on 12/09/18.
//  Copyright © 2018 TA. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  @IBOutlet var signUpViewModel: SignUpViewModel!
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var footerView: UIView!
  @IBOutlet weak var tblViewSignUP: UITableView!

  var formData = [SignUpFormData]()
  var user = User()
  
  // MARK: ViewLifeCycle Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    tblViewSignUP.dataSource = self
    formData = SignUpFormData.arraySignUpFrom
    SignUpFormData.user = user
  }

  // MARK: IBAction Methods
  
  @IBAction func tapSignUp(_ sender: Any) {
    print("You Name is \(user.userName)")
    print("You password is \(user.password)")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension SignUpViewController: FormCellDelegate {
  func textFieldValueChanged(value: String, formData: SignUpFormData) {
    switch formData {
    case .email:
        user.userName = value
    default:
      user.password = value
    }
  }
}

extension SignUpViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return formData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell12(forIndexPath: indexPath)
    let object = formData[indexPath.row]
    cell.formData = object
    cell.txtFieldInput.tag = indexPath.row
    cell.delege = self
    return cell
  }
}

/// Extend to easier allow for identifier to be set without much work
extension UITableView {
  
  /// Register cell with automatically setting Identifier
   func register<T: UITableViewCell>(_: T.Type) where T: ReuseableView {
    register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  /// Get cell with the default reuse cell identifier
  func dequeueReusableCell12<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: cellSignUp {
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath as IndexPath) as? T else {
      return UITableViewCell() as! T
      fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.defaultReuseIdentifier)")
    }
    
    return cell
  }
}

