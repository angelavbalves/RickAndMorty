//
//  CascadeOperator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation

// Define a custom operator "..." with multiplication precedence
prefix operator ...
infix operator ...: MultiplicationPrecedence

// The "@discardableResult" attribute means that the return value can be ignored without generating a compiler warning.
@discardableResult
func ...<T>(object: T, configuration: (inout T) -> Void) -> T {
    // Make a copy of the object so it can be modified
    var objectToConfigure = object

    // Call the closure passing the copy of the object so it can be configured
    configuration(&objectToConfigure)
    // The "&" character in Swift indicates that the parameter should be passed by reference, which means that the function can modify the original value of the variable that is passed as an argument

    // Return the configured object
    return objectToConfigure
}
