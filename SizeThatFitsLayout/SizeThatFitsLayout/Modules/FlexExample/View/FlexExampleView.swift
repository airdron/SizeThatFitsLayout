//
//  FlexExampleView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol FlexExampleView: UIView {
    
    func configure(viewModels: [FlexExampleViewModel])
}

class FlexExampleViewImpl: UIView, FlexExampleView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModels: [FlexExampleViewModel]) {
        
    }
}
