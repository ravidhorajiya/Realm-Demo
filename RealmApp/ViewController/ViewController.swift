//
//  ViewController.swift
//  RealmApp
//
//  Created by NC2-38 on 07/04/18.
//  Copyright © 2018 NC2-38. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  
  // MARK: Outlet
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var mobileNumberTextField: UITextField!
  @IBOutlet weak var femaleButton: UIButton!
  @IBOutlet weak var maleButton: UIButton!
  
  // MARK: Public Properties
  var realmManager = RealmManager()
  
  // MARK: Private Properties
  fileprivate var gender = "M"
  
  // MARK: Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Realm DB path
    print(RealmConfig.main.configuration.fileURL?.description ?? "")
  }
  
  // MARK: - Button
  @IBAction func tappedInsertButton(_ sender: Any) {
    let register = Registration()
    register.firstName = firstNameTextField.text!
    register.lastName = lastNameTextField.text!
    register.userName = userNameTextField.text!
    register.email = emailTextField.text!
    register.age = Int(ageTextField.text!)!
    register.mobile = Int(mobileNumberTextField.text!)!
    register.gender = gender
    if let _: Registration = realmManager.object(forKey: register.userName) {
      realmManager.save(register, update: true)
    } else {
      realmManager.save(register, update: false)
    }
  }
  
  @IBAction func tappedFetchButton(_ sender: Any) {
    let register = realmManager.fetchObject() as [Registration]
    print(register)
  }
  
  @IBAction func tappedMaleButton(_ sender: Any) {
    gender = "M"
  }
  
  @IBAction func tappedFemaleButton(_ sender: Any) {
    gender = "F"
  }
}

