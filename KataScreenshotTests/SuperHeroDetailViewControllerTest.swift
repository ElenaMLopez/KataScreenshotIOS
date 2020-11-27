//
//  SuperHeroDetailViewControllerTest.swift
//  KataScreenshotTests
//
//  Created by Elena on 27/11/2020.
//  Copyright © 2020 Karumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTest: ScreenshotTest {
    fileprivate let repository = MockSuperHeroesRepository()
    
    func testShowDetailForAHero() {
        let superHeroNoAvenger = givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHeroNoAvenger.name)
        
        verify(viewController: viewController)
    }
    
    func testShowAAvengerSuperHeroDetail() {
        let superHeroAvenger = givenASuperHero(isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController(superHeroAvenger.name)
        
        verify(viewController: viewController)
    }
    
    fileprivate func givenASuperHero(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger)
        return superHero
    }
    
    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
            
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository))
        
        return superHeroDetailViewController
        }
}
