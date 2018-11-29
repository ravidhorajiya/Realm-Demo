//
//  Results+Extensions.swift
//  RealmApp
//
//  Created by NC2-38 on 07/04/18.
//  Copyright © 2018 NC2-38. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for i in 0 ..< count {
      if let result = self[i] as? T {
        array.append(result)
      }
    }
    return array
  }
}
