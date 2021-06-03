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
    
    var formData = [SignUpForm]()
    var user = User()
    
    // MARK: ViewLifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewSignUP.dataSource = self
        formData = SignUpForm.arraySignUpFrom
        SignUpForm.user = user
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: IBAction Methods
    
    @IBAction func tapSignUp(_ sender: Any) {
        print("You Name is \(user.email)")
        print("You password is \(user.password)")
    }
    
}

extension SignUpViewController: FormCellDelegate {
  func textFieldValueChanged(value: String, formData: SignUpForm) {
    switch formData {
    case .email:
      user.email = value
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
    let cell = tableView.dequeReusableCell(indexPath: indexPath as NSIndexPath) as cellSignUp
    cell.formData = formData[indexPath.row]
    cell.txtFieldInput.tag = indexPath.row
    cell.delegate = self
    return cell
  }
}

extension UITableView {
  
  func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: ReuseableView {
    if let nib = T.nib {
      self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    } else {
      self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
  }
  
  func dequeReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: ReuseableView {
    return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath as IndexPath) as! T
  }
}

