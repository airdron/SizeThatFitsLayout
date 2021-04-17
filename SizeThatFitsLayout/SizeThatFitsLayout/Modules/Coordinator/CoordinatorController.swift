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
        let exampleViewController = moduleFactory.makeExampleSelect()
        setViewControllers([exampleViewController], animated: false)
    }
}
