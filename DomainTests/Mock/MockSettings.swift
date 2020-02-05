//
//  MockSettings.swift
//  DomainTests
//
//  Created by Chris on 06/02/2020.
//  Copyright © 2020 Chris Nevin. All rights reserved.
//

import Domain
import Foundation

class MockSettingsStorage: SettingStorage {
    var lookup: [String: Any] = [:]

    var spyGetCount: Int = 0
    var spySetCount: Int = 0

    func get<Value>(key: String, defaultValue: Value) -> Value {
        spyGetCount += 1
        return (lookup[key] as? Value) ?? defaultValue
    }

    func set<Value>(_ object: Value, key: String) {
        spySetCount += 1
        return lookup[key] = object
    }
}

class SettingsCoordinator: SettingsCoordinating {
    var dependencies: SettingsDependencies
    required init(dependencies: SettingsDependencies) {
        self.dependencies = dependencies
    }
}

final class SettingsView: SettingsViewing {
    var settings: SettingsModel?
}
