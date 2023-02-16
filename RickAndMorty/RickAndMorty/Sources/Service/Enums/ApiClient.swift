//
//  ApiClient.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/02/23.
//

import Foundation

enum ApiClient {
    private static var urls: AppEndpoints?

    static func setURLs(_ urls: AppEndpoints) {
        ApiClient.urls = urls
    }

    static func getURLs() -> AppEndpoints? {
        return urls
    }
}
