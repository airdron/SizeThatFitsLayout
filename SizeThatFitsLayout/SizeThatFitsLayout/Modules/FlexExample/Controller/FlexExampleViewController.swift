//
//  FlexExampleViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

final class FlexExampleViewController<RootView: FlexExampleView>: UIViewController, ViewSpecifying {
    typealias View = RootView
    
    private let testModel = FlexExampleModel()
    
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
                    image: testModel.image)
            )
        )
    }
}
