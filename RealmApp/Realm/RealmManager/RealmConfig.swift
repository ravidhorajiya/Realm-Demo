//
//  RealmConfig.swift
//  RealmApp
//
//  Created by NC2-38 on 07/04/18.
//  Copyright © 2018 NC2-38. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmConfig {
  
  // MARK: - private configurations
  private static let mainConfig = Realm.Configuration( fileURL: NSURL.inDocumentsFolder(fileName: "main.realm"))
  
  // MARK: - enum cases
  case main
  
  // MARK: - current configuration
  var configuration: Realm.Configuration {
    switch self {
    case .main:
      return RealmConfig.mainConfig
    }
  }
}

extension NSURL {
  class func inDocumentsFolder(fileName: String) -> URL {
    return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
      .appendingPathComponent(fileName)
  }
}
