//
//  SendRequestCell.swift
//  ExpandableCells
//
//  Created by Davit on 22.07.22.
//

import UIKit

class SendRequestCell: UITableViewCell {
    //MARK: - Views
    let sendRequestLabel = UILabel(text: "Send Request", font: .systemFont(ofSize: 16, weight: .medium), textColot: .label)
    let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
    let hStack = UIStackView(axis: .horizontal, distribution: .equalSpacing)
    
    let containerView = ContainerView()
    var anchor: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup() 
    }
    
    private func setup() {
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        
        containerView.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.addArrangedSubviews([sendRequestLabel, chevronImageView])
    }
    
    private func layout() {
        anchor = containerView.heightAnchor.constraint(equalToConstant: 55)

        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            hStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            anchor,

            contentView.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.2) {
                self.anchor.constant = 230
                self.chevronImageView.transform = CGAffineTransform(rotationAngle: .pi)
                self.layoutIfNeeded()
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            UIView.animate(withDuration: 0.2) {
                self.anchor.constant = 55
                self.chevronImageView.transform = .identity
                self.layoutIfNeeded()
            }
        }
    }
}
