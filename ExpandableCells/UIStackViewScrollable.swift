//
//  UIStackViewScrollable.swift
//  ExpandableCells
//
//  Created by Davit on 26.07.22.
//

import UIKit

class ScrollingStackView: UIScrollView {
    let contentView = UIView()
    
    init(from stackView: UIStackView) {
        super.init(frame: .zero)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        contentView.addSubview(stackView)
        
        let widthConstraint = contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor)
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: frameLayoutGuide.heightAnchor)
        
        switch stackView.axis {
        case .horizontal:
            widthConstraint.priority = UILayoutPriority(1)
        case .vertical:
            heightConstraint.priority = UILayoutPriority(1)
        @unknown default:
            break
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),

            widthConstraint,
            heightConstraint,
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

