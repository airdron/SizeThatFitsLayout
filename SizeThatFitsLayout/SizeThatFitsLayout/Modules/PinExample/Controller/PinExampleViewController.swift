//
//  PinExampleViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

final class PinExampleViewController<RootView: PinExampleView>: UIViewController, ViewSpecifying {
    typealias View = RootView
    
    override func loadView() {
        view = RootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
    }
}
