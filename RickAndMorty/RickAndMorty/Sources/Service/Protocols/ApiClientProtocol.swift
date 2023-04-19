//
//  ApiClientProtocol.swift
//  RickAndMorty
//
//  Created by Angela Alves on 06/02/23.
//

import Foundation
import RxSwift

protocol ApiClientProtocol {
    func makeRequest<T: Decodable>(endpoint: RickAndMortyEndpoints) -> Single<T>
}
