//
//  FlexExampleChildView.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 03.05.2021.
//

import UIKit
import FlexLayout

class FlexExampleChildView: UIView {
    
    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    private let imageView = UIImageView()
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
        makeFlex()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        leftLabel.numberOfLines = 0
        rightLabel.numberOfLines = 0
    }
    
    private func makeFlex() {
        containerView.flex.define { flex in
            flex.addItem(imageView)
                .aspectRatio(275.0 / 183.0)
            flex.addItem()
                .direction(.row)
                .define { flex in
                    flex.addItem(leftLabel)
                        .grow(1)
                    flex.addItem(rightLabel)
                        .grow(1)
                }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.frame.size.width = bounds.width
        containerView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        containerView.flex.sizeThatFits(size: .init(width: size.width, height: .nan))
    }
    
    func configure(viewModel: FlexExampleChildViewModel) {
        leftLabel.text = viewModel.author
        rightLabel.text = viewModel.imageName
        imageView.image = viewModel.image
        
        [leftLabel, rightLabel, imageView].forEach {
            $0.flex.markDirty()
        }
        setNeedsLayout()
    }
}
