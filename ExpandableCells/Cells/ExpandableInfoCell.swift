//
//  ExpandableInfoCell.swift
//  ExpandableCells
//
//  Created by Davit on 19.07.22.
//

import UIKit

enum CellConfiguration {
    case expanded
    case collapsed
}

class ExpandableInfoCell: UITableViewCell {
    var anchor: NSLayoutConstraint!
    let tournamentView = TournamentView()
    let containerView = ContainerView()
    
    //MARK: - Close Expand Horizontal Stack
    let expandHStack = UIStackView(axis: .horizontal, distribution: .equalSpacing)

    let expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show more", for: .normal)
        return button
    }()
    
    let playersLabel = UILabel(text: "5 Players - Team", font: .systemFont(ofSize: 12), textColot: .label)
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        conf()
    }
    
    convenience init(_ configuration: CellConfiguration) {
        self.init()
        switch configuration {
        case .expanded:
            isExpanded()
        case .collapsed:
            isCollapsed()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Methods
    func conf() {
        expandButton.addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
        
        clipsToBounds = false
        contentView.clipsToBounds = false
        contentView.addSubview(containerView)
        
        containerView.clipsToBounds = true
        expandHStack.addArrangedSubviews([expandButton, playersLabel])
        expandHStack.translatesAutoresizingMaskIntoConstraints = false
        expandHStack.backgroundColor = .systemBackground
        
        containerView.addSubview(tournamentView)
        containerView.clipsToBounds = true
        
        containerView.backgroundColor = .systemBackground
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        tournamentView.translatesAutoresizingMaskIntoConstraints = false
        tournamentView.frame = containerView.frame
        
        NSLayoutConstraint.activate([
            tournamentView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tournamentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tournamentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func isExpanded() {
        NSLayoutConstraint.activate([
            tournamentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: tournamentView.bottomAnchor),
        ])
    }
    
    func isCollapsed() {
        containerView.addSubview(expandHStack)
        anchor = containerView.heightAnchor.constraint(equalToConstant: 148)
        tournamentView.deleteButton.isHidden = true

        NSLayoutConstraint.activate([
            anchor,
            
            expandHStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            expandHStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            expandHStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            contentView.heightAnchor.constraint(equalToConstant: 148),
        ])
    }
    
    @objc func expandButtonTapped() {
        expandView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.colapseView()
        }
    }
    
    fileprivate func colapseView() {
        UIView.animate(withDuration: 0.2) {
            self.anchor.constant = 148
            self.layoutIfNeeded()
        }
    }
    
    fileprivate func expandView() {
        UIView.animate(withDuration: 0.2) {
            self.anchor.constant = self.tournamentView.frame.height
            self.layoutIfNeeded()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        colapseView()
        isCollapsed()

        anchor.constant = 148
        layoutIfNeeded()
    }
}
