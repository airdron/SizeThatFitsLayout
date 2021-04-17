//
//  ModuleFactory.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol ModuleFactory {
    func makeRootController() -> UIViewController
    func makeCoordinator() -> UIViewController
    func makeExampleSelect() -> UIViewController
}

class ModuleFactoryImpl: ModuleFactory {
    
    func makeRootController() -> UIViewController {
        return RootViewController(coordinatorController: makeCoordinator())
    }
    
    func makeCoordinator() -> UIViewController {
        return CoordinatorController(moduleFactory: self)
    }
    
    func makeExampleSelect() -> UIViewController {
        return ExampleSelectViewController<ExampleSelectRootViewImpl>()
    }
}

// MARK: - Private
private extension ModuleFactoryImpl {
    
}
