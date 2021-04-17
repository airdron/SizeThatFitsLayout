//
//  FrameExampleView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol FrameExampleView: UIView {
    
    func configure(viewModels: [FrameExampleViewModel])
}

class FrameExampleViewImpl: UIView, FrameExampleView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModels: [FrameExampleViewModel]) {
        
    }
}
