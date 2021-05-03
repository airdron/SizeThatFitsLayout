//
//  ExampleSelectViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol ExampleSelectModuleOutput: AnyObject {
    var onFrameExample: (() -> Void)? { get set }
    var onFlexExample: (() -> Void)? { get set }
    var onPinExample: (() -> Void)? { get set }

}

final class ExampleSelectViewController<RootView: ExampleSelectRootView>: UIViewController,
                                                                          ViewSpecifying,
                                                                          ExampleSelectModuleOutput {
    typealias View = RootView
    
    // MARK: - ExampleSelectModuleOutput
    var onFrameExample: (() -> Void)?
    var onFlexExample: (() -> Void)?
    var onPinExample: (() -> Void)?
    
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
                                              selectionHandler: { [weak self] in
                                                self?.onFrameExample?()
                                              })
            case .flexLayout:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: { [weak self] in
                                                self?.onFlexExample?()
                                              })
            case .pinLayout:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: { [weak self] in
                                                self?.onPinExample?()
                                              })
            case .autoLayoutSizeThatFits:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: { [weak self] in
                                                
                                              })
            case .autoLayoutSystemLayoutFittingSize:
                return ExampleSelectViewModel(title: type.title,
                                              selectionHandler: { [weak self] in
                                                
                                              })
            }
        }
        rootView.configure(viewModels: viewModels)
    }
}
