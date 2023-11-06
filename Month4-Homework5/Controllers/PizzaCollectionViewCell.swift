//
//  PizzaCollectionViewCell.swift
//  Month4-Homework5
//
//  Created by Mac User on 9/11/23.
//

import UIKit

class PizzaCollectionViewCell: UICollectionViewCell {
    
    private let bgView = UIView()
    
    private let sizeLbl = MakerElements.shared.makeLbl(textColor: .systemGray,
                                                       size: 16,
                                                       textAlignment: .center
    )
    override init(frame: CGRect) {
        super.init(frame: frame)
        allSetUpConstarints()
        
    }
    
    private func allSetUpConstarints() {
        contentView.backgroundColor = .white
        setUpConstrainsForBGView()
        setupConstrainsforSizeLbl()
    }
    
    private func setUpConstrainsForBGView() {
        contentView.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupConstrainsforSizeLbl() {
        contentView.addSubview(sizeLbl)
        NSLayoutConstraint.activate([
            sizeLbl.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            sizeLbl.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
        ])
    }
    
    func initDataCell(_ sizes: String) {
        sizeLbl.text = sizes
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

