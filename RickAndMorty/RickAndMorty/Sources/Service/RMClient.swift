//
//  RMClient.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation
import RxSwift

class RMClient: ApiClientProtocol {
    func makeRequest<T: Decodable>(url: URL) -> Observable<T> {
        Observable<T>.create { observer in
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    observer.onError(Errors.invalidResponse)
                    observer.onCompleted()
                    return
                }
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(model)
                } catch {
                    observer.onError(error)
                }
                observer.onCompleted()
            }

            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
