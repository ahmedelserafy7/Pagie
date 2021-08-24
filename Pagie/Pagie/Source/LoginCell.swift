//
//  LoginCell.swift
//  Pagie
//
//  Created by Elser_10 on 8/21/21.
//

import UIKit

open class LoginCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to login page, ace!"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "It's time to setup your own login page."
        label.font = UIFont.systemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    open override func setupViews() {
        self.backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60)
        ])
        
        _ = subtitleLabel.anchor(titleLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
