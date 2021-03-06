//
//  AnyDependencies.swift
//  Domain
//
//  Created by Chris on 04/02/2020.
//  Copyright © 2020 Chris Nevin. All rights reserved.
//

import Foundation

public protocol APIHaving {
    var api: AnyAPI { get }
}

public protocol DatabaseHaving {
    var database: AnyDatabase { get }
}

public protocol AnyDependencies: APIHaving, DatabaseHaving { }
