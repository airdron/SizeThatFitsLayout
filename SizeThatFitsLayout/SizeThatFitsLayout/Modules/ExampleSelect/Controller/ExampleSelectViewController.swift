//
//  ExampleSelectViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

final class ExampleSelectViewController<RootView: ExampleSelectRootView>: UIViewController, ViewSpecifying {
    typealias View = RootView
    
    override func loadView() {
        view = RootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let viewModels = ExampleSelectModel.allCases.map { type -> ExampleSelectViewModel in
            switch type {
            case .frame:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: {
                                                
                                              })
            case .flexLayout:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: {
                                                
                                              })
            case .pinLayout:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: {
                                                
                                              })
            }
        }
        rootView.configure(viewModels: viewModels)
    }
}
