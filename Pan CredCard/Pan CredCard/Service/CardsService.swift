//
//  CardsService.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//


import Alamofire

class CardsService {
    
    public func getCardsAlamofire(completion: @escaping (Result<ListCards, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/32036945-5a73-4dad-b495-8349cc853026"
        AF.request(urlString, method: .get).responseDecodable(of: ListCards.self) { response in
            switch response.result {
            case .success(let cards):
                completion(.success(cards))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
