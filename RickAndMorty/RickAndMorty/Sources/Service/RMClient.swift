//
//  RMClient.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation
import RxSwift

class RMClient: ApiClientProtocol {
    func makeRequest<T: Decodable>(endpoint: RickAndMortyEndpoints) -> Observable<T> {
        Observable.create { observer in
            var components = URLComponents()
            components.scheme = "https"
            components.host = endpoint.host
            components.path = endpoint.path
            components.queryItems = endpoint.query

            let urlComponent = components.url

            if let url = urlComponent {
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        observer.onError(error)
                        observer.onCompleted()
                    }

                    guard
                        let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode)
                    else {
                        observer.onError(
                            ErrorState
                                .badRequest(
                                    "the return of the request was different from 2xx")
                        )
                        observer.onCompleted()
                        return
                    }

                    guard let data = data else {
                        observer.onError(
                            ErrorState
                                .invalidData("Invalid Data")
                        )
                        observer.onCompleted()
                        return
                    }

                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(model)
                    } catch {
                        observer.onError(ErrorState.generic("Decoding Error"))
                    }
                }.resume()
            }
            return Disposables.create()
        }
    }
}
