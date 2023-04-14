//
//  ErrorState.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation

enum ErrorState: Swift.Error {
    case generic(_ description: String)
    case badRequest(_ description: String)
    case invalidData(_ description: String)
    case unrecognizedError(_ description: String)
}
