//
//  PinExampleViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

final class PinExampleViewController<RootView: PinExampleView>: UIViewController, ViewSpecifying {
    typealias View = RootView
    
    private let testModel = PinExampleModel()
    
    override func loadView() {
        view = RootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        rootView.configure(
            viewModel: .init(
                childViewModel: .init(
                    author: testModel.author,
                    imageName: testModel.imageName,
                    date: testModel.date,
                    image: testModel.image
                )
            )
        )
    }
}
