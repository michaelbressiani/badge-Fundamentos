//
//  SplashScreenCoordinator.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import Foundation
import UIKit


class SplashScreenCoordinator: UIViewController {
    
    func moveToListCardsView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//            self.navigationController?.pushViewController(ListCardsViewController(), animated: true)
        })
    }
}
