//
//  PinExampleChildView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 03.05.2021.
//

import UIKit
import PinLayout

class PinExampleChildView: UIView {
    
    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    private let dateLabel = UILabel()
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
        containerView.addSubview(leftLabel)
        containerView.addSubview(rightLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(imageView)

        leftLabel.numberOfLines = 0
        rightLabel.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.pin.all()
        leftLabel.pin
            .top()
            .left()
            .width(50%)
            .sizeToFit(.width)
        
        rightLabel.pin
            .top()
            .after(of: leftLabel)
            .right()
            .sizeToFit(.width)
        
        imageView.pin
            .below(of: [leftLabel, rightLabel])
            .horizontally()
            .aspectRatio(275.0 / 183.0)
        
        dateLabel.pin
            .below(of: imageView)
            .horizontally()
            .sizeToFit(.width)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return containerView.autoSizeThatFits(size, layoutClosure: {
            layoutSubviews()
        })
    }
    
    func configure(viewModel: PinExampleChildViewModel) {
        leftLabel.text = viewModel.author
        rightLabel.text = viewModel.imageName
        imageView.image = viewModel.image
        dateLabel.text = viewModel.date
        
        setNeedsLayout()
    }
}
