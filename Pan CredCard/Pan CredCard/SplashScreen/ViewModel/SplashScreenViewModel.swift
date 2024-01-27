//
//  SplashScreenViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 27/01/24.
//

import UIKit


class SplashScreenViewModel {
    
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func navigationListCredCards() {
        let vcString = String(describing: ListCredCardsViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? ListCredCardsViewController
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.viewController.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        })
    }
}
