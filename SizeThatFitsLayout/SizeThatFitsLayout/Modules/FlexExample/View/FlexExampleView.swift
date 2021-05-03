//
//  FlexExampleView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol FlexExampleView: UIView {
    
    func configure(viewModel: FlexExampleViewModel)
}

class FlexExampleViewImpl: UIView, FlexExampleView {
    
    private let scrollView = UIScrollView()
    private let childView = FlexExampleChildView()
    private let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        separatorView.backgroundColor = .systemGray
        addSubview(scrollView)
        scrollView.addSubview(childView)
        scrollView.addSubview(separatorView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.frame.origin.y = safeAreaInsets.top
        scrollView.frame.origin.x = safeAreaInsets.left
        scrollView.frame.size.width = bounds.width - safeAreaInsets.left - safeAreaInsets.right
        scrollView.frame.size.height = bounds.height - safeAreaInsets.top - safeAreaInsets.bottom

        childView.frame.size.width = scrollView.bounds.width
        childView.sizeToFit()
        
        separatorView.frame.origin.y = childView.frame.maxY
        separatorView.frame.size.height = Constants.separatorHeight
        separatorView.frame.size.width = scrollView.bounds.width
        
        scrollView.contentSize.height = separatorView.frame.maxY
    }
    
    func configure(viewModel: FlexExampleViewModel) {
        childView.configure(viewModel: viewModel.childViewModel)
        setNeedsLayout()
    }
}

private struct Constants {
    static let separatorHeight: CGFloat = 10
}
