//
//  CredCard.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import Foundation

struct ListCards: Decodable {
    let cardsList: [[String: Card]]
}

// MARK: - CardsList
struct Card: Decodable {
    let alias: String?
    let credit: Bool
    let debit: Bool?
    let number, codSec, image: String
}
