//
//  EndpointProtocol.swift
//  Project01
//
//  Created by Angela Alves on 12/04/23.
//

import Foundation

protocol EndpointProtocol {
    var host: String { get }
    var method: String { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
}
