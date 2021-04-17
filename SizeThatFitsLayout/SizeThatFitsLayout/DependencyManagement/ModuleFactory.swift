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
    func makeExampleSelect() -> UIViewController & ExampleSelectModuleOutput
    func makeFrameExample() -> UIViewController
    func makeFlexExample() -> UIViewController
    func makePinExample() -> UIViewController
}

class ModuleFactoryImpl: ModuleFactory {
    
    func makeRootController() -> UIViewController {
        return RootViewController(coordinatorController: makeCoordinator())
    }
    
    func makeCoordinator() -> UIViewController {
        return CoordinatorController(moduleFactory: self)
    }
    
    func makeExampleSelect() -> UIViewController & ExampleSelectModuleOutput {
        return ExampleSelectViewController<ExampleSelectRootViewImpl>()
    }
    
    func makeFrameExample() -> UIViewController {
        return FrameExampleViewController<FrameExampleViewImpl>()
    }
    
    func makeFlexExample() -> UIViewController {
        return FlexExampleViewController<FlexExampleViewImpl>()
    }
    
    func makePinExample() -> UIViewController {
        return PinExampleViewController<PinExampleViewImpl>()
    }
}

// MARK: - Private
private extension ModuleFactoryImpl {
    
}
