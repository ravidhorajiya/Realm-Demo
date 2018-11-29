//
//  RealmManager.swift
//  RealmApp
//
//  Created by NC2-38 on 07/04/18.
//  Copyright © 2018 NC2-38. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
  lazy var mainRealm: Realm? = {
    return try? Realm(configuration: RealmConfig.main.configuration)
  }()
  
  // Save the given object in Realm DB
  @discardableResult
  func save(_ object: Object, update: Bool) -> Bool {
    do {
      let realm = try Realm(configuration: RealmConfig.main.configuration)
      try realm.write {
        update ? realm.add(object, update: true) : realm.add(object)
      }
    } catch {
      // Failed to save the object
      return false
    }
    return true
  }
  
  // Remove the object from the Realm DB.
  func delete(_ object: Object) {
    guard let realm = mainRealm else {
      return
    }
    realm.delete(object)
  }
  
  /// Returns a object with the given type.
  ///
  /// - Parameter primaryKey: primary key to search.
  /// - Returns: An optional object reference
  
  func object<T: Object>(forKey primaryKey: String) -> T? {
    guard let realm = mainRealm else {
      return nil
    }
    return realm.object(ofType: T.self, forPrimaryKey: primaryKey)
  }
  
  // fetch all objects
  func fetchObject<T: Object>() -> [T] {
    guard let realm = mainRealm else {
      return []
    }
    return realm.objects(T.self).map { $0 }
  }
}
