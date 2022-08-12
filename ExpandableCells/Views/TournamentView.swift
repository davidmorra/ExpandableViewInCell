//
//  TournamentView.swift
//  ExpandableCells
//
//  Created by Davit on 19.07.22.
//

import UIKit

class TournamentView: UIView {
    var colapsedHeight: CGFloat = 0
    var frameHeight: CGFloat {
        frame.size.height
    }
    
    //MARK: - Main Vertical Stack
    let mainVStack = UIStackView(spacing: 16, distribution: .fillProportionally)
    
    //MARK: - Header Vertical Stack
    let headerHStack = UIStackView(axis: .horizontal, distribution: .fillProportionally)
        
    //MARK: - Tournament Title Vertical Stack
    let titleVStack = UIStackView(axis: .vertical, distribution: .equalCentering)
    
    let tournamentTitle = UILabel(text: "Football Tournament", font: .systemFont(ofSize: 16), textColot: .label)
    let statusLabel = UILabel(text: "Upcoming", font: .boldSystemFont(ofSize: 16), textColot: .orange)
    let dateLabel = UILabel(text: "20 - 27 August, 22", font: .systemFont(ofSize: 12), textColot: .systemGray)
    
    //MARK: - Header Right Stack
    let headerRightVStack = UIStackView(spacing: 24, alignment: .trailing, distribution: .fillProportionally)
    
    //MARK: - Footer Vertical Stack
    let footerVStack = UIStackView(axis: .horizontal, spacing: 8, alignment: .fill, distribution: .equalSpacing)
    
    //MARK: - Joined Users View
    let joinedPeopleLabel = UILabel(text: "30 People Joined", font: .systemFont(ofSize: 14), textColot: .purple)
    let userPhotoView = UIView()
    
    let deleteButton: UIImageView = .init(image: UIImage(systemName: "trash"))
    
    let tournamentImage: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    //MARK: - Details Vertical Stack
    let detailVStack = UIStackView(spacing: 16, distribution: .fill)
    let descriptionLabel = UILabel(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.", font: .systemFont(ofSize: 14), textColot: .label, nOl: 0)
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Methods
    private func configureLayout() {
        addSubview(headerHStack)
        addSubview(footerVStack)
        addSubview(detailVStack)
        
        headerHStack.translatesAutoresizingMaskIntoConstraints = false
        headerHStack.addArrangedSubviews([titleVStack, headerRightVStack])
        
        titleVStack.addArrangedSubviews([tournamentTitle, statusLabel, dateLabel])
        
        headerRightVStack.addArrangedSubviews([deleteButton, tournamentImage])
        
        deleteButton.isHidden = true
        deleteButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 24).isActive = true

        tournamentImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        tournamentImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        tournamentImage.layer.cornerRadius = 40

        
        footerVStack.addArrangedSubviews([joinedPeopleLabel, userPhotoView])
        footerVStack.translatesAutoresizingMaskIntoConstraints = false
        userPhotoView.backgroundColor = .purple
        userPhotoView.layer.cornerRadius = userPhotoView.frame.width/2
        
        userPhotoView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        userPhotoView.widthAnchor.constraint(equalToConstant: 24).isActive = true

        detailVStack.translatesAutoresizingMaskIntoConstraints = false
        detailVStack.addArrangedSubviews([
            UILabel(text: "Description", font: .systemFont(ofSize: 14), textColot: .systemGray2, nOl: 1),
            descriptionLabel,
            UILabel(text: "Tbilisi, Georgia", font: .systemFont(ofSize: 14), textColot: .systemGray2),
            UILabel(text: "Organised by: Tony Stark", font: .systemFont(ofSize: 14), textColot: .label),
            UILabel(text: "Registration ends", font: .boldSystemFont(ofSize: 16), textColot: .purple),
            ])
        

        NSLayoutConstraint.activate([
            headerHStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerHStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerHStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            footerVStack.topAnchor.constraint(equalTo: headerHStack.bottomAnchor, constant: 16),
            footerVStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            footerVStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            detailVStack.topAnchor.constraint(equalTo: footerVStack.bottomAnchor, constant: 16),
            detailVStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            detailVStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            bottomAnchor.constraint(equalTo: detailVStack.bottomAnchor, constant: 16),
        ])
    }
}

extension UILabel {
    convenience init(text: String, font: UIFont, textColot: UIColor, nOl: Int = 0) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColot
        self.numberOfLines = nOl
    }
}

