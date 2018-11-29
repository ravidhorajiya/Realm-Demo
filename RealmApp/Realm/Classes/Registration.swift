//
//  Registration.swift
//  RealmApp
//
//  Created by NC2-38 on 07/04/18.
//  Copyright © 2018 NC2-38. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: Model
final class Registration: Object {
  @objc dynamic var firstName = ""
  @objc dynamic var lastName = ""
  @objc dynamic var userName = ""
  @objc dynamic var email = ""
  @objc dynamic var age = 0
  @objc dynamic var mobile = 0
  @objc dynamic var gender = ""
  
  override static func primaryKey() -> String? {
    return "userName"
  }
}

