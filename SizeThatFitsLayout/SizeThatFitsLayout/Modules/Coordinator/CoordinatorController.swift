//
//  CoordinatorController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

class CoordinatorController: UINavigationController {
    
    private let moduleFactory: ModuleFactory
    
    init(moduleFactory: ModuleFactory) {
        self.moduleFactory = moduleFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        showExampleSelect()
    }
    
    private func showExampleSelect() {
        let exampleSelectViewController = moduleFactory.makeExampleSelect()
        
        exampleSelectViewController.onFrameExample = { [weak self] in
            self?.showFrameExample()
        }
        
        exampleSelectViewController.onPinExample = { [weak self] in
            self?.showPinExample()
        }
        
        exampleSelectViewController.onFlexExample = { [weak self] in
            self?.showFlexExample()
        }
        
        setViewControllers([exampleSelectViewController], animated: false)
    }
    
    private func showFrameExample() {
        let frameExampleViewController = moduleFactory.makeFrameExample()
        pushViewController(frameExampleViewController, animated: true)
    }
    
    private func showFlexExample() {
        let flexExampleViewController = moduleFactory.makeFlexExample()
        pushViewController(flexExampleViewController, animated: true)
    }
    
    private func showPinExample() {
        let pinExampleViewController = moduleFactory.makePinExample()
        pushViewController(pinExampleViewController, animated: true)
    }
}
