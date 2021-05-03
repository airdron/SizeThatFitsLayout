//
//  FrameExampleChildView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 03.05.2021.
//

import UIKit
import PinLayout

class FrameExampleChildView: UIView {
    
    private let nameLabel = UILabel()
    private let imageView = UIImageView()
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(imageView)

        nameLabel.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout(containerViewWidth: bounds.width)
    }
    
    private func layout(containerViewWidth: CGFloat) {
        containerView.frame.size.width = containerViewWidth
        nameLabel.frame.size.width = containerView.bounds.width
        nameLabel.sizeToFit()
        
        let imageViewAspectRatio: CGFloat = 275.0 / 183.0
        
        imageView.frame.origin.y = nameLabel.frame.maxY
        imageView.frame.size.width = containerView.bounds.width
        imageView.frame.size.height = imageView.frame.size.width / imageViewAspectRatio
        
        containerView.frame.size.height = imageView.frame.maxY
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout(containerViewWidth: size.width)
        return containerView.frame.size
    }
    
    func configure(viewModel: FrameExampleChildViewModel) {
        nameLabel.text = viewModel.imageName
        imageView.image = viewModel.image
        setNeedsLayout()
    }
}
