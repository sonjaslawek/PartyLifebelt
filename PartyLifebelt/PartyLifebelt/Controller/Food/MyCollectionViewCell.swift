//
//  MyCollectionViewCell.swift
//  PartyLifebelt
//
//  Created by Sonja on 16/04/2023.
//
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            configure()
        }
    
    private func configure() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 30))
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 30, width: contentView.frame.width, height: contentView.frame.height - 30))
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imageView.image = nil
    }
}
