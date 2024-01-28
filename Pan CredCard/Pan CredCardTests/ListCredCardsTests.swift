//
//  ListCredCardsTests.swift
//  Pan CredCardTests
//
//  Created by Michael Bressiani on 28/01/24.
//

import XCTest
@testable import Pan_CredCard

final class ListCredCardsTests: XCTestCase {
    
    var listCredCardsViewModel: ListCredCardsViewModel!
    var imageString: ImageString!

    override func setUpWithError() throws {
        listCredCardsViewModel = ListCredCardsViewModel(viewController: UIViewController())
        imageString = ImageString()
    }

    override func tearDownWithError() throws {
        listCredCardsViewModel = nil
        imageString = nil
    }

    func testNumberOfRows() throws {
        let card1 = Card(id: 1, name: "Test1" , alias: "Test1", credit: true, debit: true, number: "1", codSec: "1", image: "1")
      
        listCredCardsViewModel.cards = ListCards(cards: [card1])
        let numberOfRows = listCredCardsViewModel.numberOfRows()
        XCTAssertEqual(numberOfRows, 1)
        
        listCredCardsViewModel.cards = nil
        let numberOfRowsZero = listCredCardsViewModel.numberOfRows()
        XCTAssertEqual(numberOfRowsZero, 0)
    }
    
    func testGetCardList() throws {
        let card1 = Card(id: 1, name: "Test1" , alias: "Test1", credit: true, debit: true, number: "1", codSec: "1", image: "1")
        
        listCredCardsViewModel.cards = ListCards(cards: [card1])
        let indexPath: IndexPath = IndexPath(item: 0, section: 0)
        let getCards = listCredCardsViewModel.getCardList(indexPath: indexPath)
        XCTAssertEqual(getCards.id, card1.id)
        XCTAssertEqual(getCards.name, card1.name)
        XCTAssertEqual(getCards.alias, card1.alias)
        XCTAssertEqual(getCards.number, card1.number)
        XCTAssertEqual(getCards.codSec, card1.codSec)
        XCTAssertEqual(getCards.image, card1.image)
        
        listCredCardsViewModel.cards = nil
        let getCardsNil = listCredCardsViewModel.getCardList(indexPath: indexPath)
        let cardEmpty = listCredCardsViewModel.cardEmpty
        XCTAssertEqual(getCardsNil.id, cardEmpty.id)
        XCTAssertEqual(getCardsNil.name, cardEmpty.name)
        XCTAssertEqual(getCardsNil.alias, cardEmpty.alias)
        XCTAssertEqual(getCardsNil.number, cardEmpty.number)
        XCTAssertEqual(getCardsNil.codSec, cardEmpty.codSec)
        XCTAssertEqual(getCardsNil.image, cardEmpty.image)
    }
    
    func testAccessibilityCell() throws {
    
            let indexPath = IndexPath(row: 0, section: 0)
            let cell = UITableViewCell()

            let card1 = Card(id: 1, name: "Test1" , alias: "Test1", credit: true, debit: true, number: "1", codSec: "1", image: "1")
        
            listCredCardsViewModel.cards = ListCards(cards: [card1])
            listCredCardsViewModel.accessibilityCell(cell: cell, indexPath: indexPath)
            XCTAssertTrue(cell.isAccessibilityElement)
            XCTAssertEqual(cell.accessibilityHint, "Cartão: Test1")
        }
    
    func testConvertBase64ToImage() throws {
        
        let base64Empty = ""
        let imageNilTest1 = listCredCardsViewModel.convertBase64ToImage(base64String: base64Empty)
        XCTAssertEqual(imageNilTest1, UIImage())
        
        let base64InvalidNotEmpty = "Any non-empty string that does not match an image in base64"
        let imageNilTest2 = listCredCardsViewModel.convertBase64ToImage(base64String: base64InvalidNotEmpty)
        XCTAssertEqual(imageNilTest2, UIImage())
        
        
        let imageBase64Valid = imageString.imageBase64Valid
        let imageNotNilTest = listCredCardsViewModel.convertBase64ToImage(base64String: imageBase64Valid)
        XCTAssertNotEqual(imageNotNilTest, UIImage())
        XCTAssertTrue(imageNotNilTest.size.width > 0)
        XCTAssertTrue(imageNotNilTest.size.height > 0)
    }
    
    func testLastForDigits() throws {
        let cardNumberTest = "5555 0000 1111 1234"
        let lastForDigitsTest = listCredCardsViewModel.lastForDigits(cardNumber: cardNumberTest)
        XCTAssertEqual(lastForDigitsTest, "1234")
    }
    
    func testNavegationToDetailsCard() throws {
            
        let card = Card(id: 1, name: "Test1", alias: "Test1", credit: true, debit: true, number: "1", codSec: "1", image: "1")
        listCredCardsViewModel.cards = ListCards(cards: [card])
        let emptyViewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: emptyViewController)
        listCredCardsViewModel.viewController = emptyViewController
        listCredCardsViewModel.navegationToDetailsCard(indexPath: IndexPath(item: 0, section: 0))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               XCTAssertTrue(navigationController.topViewController is DetailsCardViewController)
           }
    }
}
