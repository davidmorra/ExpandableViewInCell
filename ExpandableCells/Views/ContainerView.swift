//
//  ContainerView.swift
//  ExpandableCells
//
//  Created by Davit on 22.07.22.
//

import UIKit

class ContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
