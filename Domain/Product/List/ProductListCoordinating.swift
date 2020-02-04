//
//  ProductListCoordinating.swift
//  Domain
//
//  Created by Chris on 03/02/2020.
//  Copyright © 2020 cjnevin. All rights reserved.
//

import Foundation

public protocol ProductListCoordinating: PushCoordinating, ProductCoordinating {
    associatedtype ProductView: ProductViewing
    associatedtype Product: ProductModel
    init(dependencies: ProductListDependencies)
    var dependencies: ProductListDependencies { get }
    func view(for product: Product, modelStorage: ModelStorage) -> ProductView
}

extension ProductListCoordinating {
    public typealias ProductListDependencies = ModelStorageHaving & RequestExecutorHaving
    func selectedProduct(_ product: Product) {
        push(view(for: product, modelStorage: dependencies.modelStorage))
    }
}