//
//  FormData.swift
//  SignUpFormWithEnum
//
//  Created by Gurjinder Singh on 12/09/18.
//  Copyright © 2018 TA. All rights reserved.
//

import Foundation
import UIKit

class User {
  var userName: String = ""
  var password: String = ""
}

enum SignUpFormData {
  case email
  case password
  
  static var arraySignUpFrom = [email, password]
  static var user: User? = nil
  
  var user: User {
    get {
      return SignUpFormData.user!
    }
    set {
      user = newValue
    }
  }
  
  var secureTextEntry: Bool {
    get {
      switch self {
      case .email:
        return false
      default:
        return true
      }
    }
  }
  
  var keyBoardType: UIKeyboardType {
    get {
      switch self {
      case .email:
        return .emailAddress
      default:
        return .default
      }
    }
  }
  
  var textFieldPlaceHolder: String {
    get {
      switch  self {
      case .email:
        return "Enter email address"
      default:
        return "Enter Password"
      }
    }
  }
  
  var labelPlaceHolder: String {
    get {
      switch  self {
      case .email:
        return "Email"
      default:
        return "Password"
      }
    }
  }
}
