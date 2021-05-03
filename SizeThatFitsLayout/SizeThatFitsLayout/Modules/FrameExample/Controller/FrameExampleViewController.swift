//
//  FrameExampleViewController.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

final class FrameExampleViewController<RootView: FrameExampleView>: UIViewController, ViewSpecifying {
    typealias View = RootView
    
    private let testModel = FrameExampleModel()
    
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
                    imageName: testModel.imageName,
                    image: testModel.image
                )
            )
        )
    }
}
