//
//  BaseCell.swift
//  Pagie
//
//  Created by Elser_10 on 8/21/21.
//

import UIKit

open class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public func setupViews() {}
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
