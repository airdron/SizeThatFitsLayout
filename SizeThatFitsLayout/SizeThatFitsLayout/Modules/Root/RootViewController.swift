//
//  RootViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

class RootViewController: UIViewController {
    
    private let coordinatorController: UIViewController
    
    init(coordinatorController: UIViewController) {
        self.coordinatorController = coordinatorController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(coordinatorController)
        view.addSubview(coordinatorController.view)
        coordinatorController.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coordinatorController.view.frame = view.bounds
    }
}
