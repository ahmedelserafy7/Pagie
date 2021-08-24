//
//  PageCell.swift
//  Pagie
//
//  Created by Elser_10 on 3/25/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

public class PageCell: BaseCell {
    
    public var page: Page? {
        didSet {
            
            guard let page = page else { return }
            guard let title = page.title else { return }
            guard let subtitle = page.subtitle else { return }
            guard let imageName = page.imageName else { return }
            
            pageImageView.image = UIImage(named: imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(subtitle)", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    let pageImageView: UIImageView = {
        let image = UIImage(named: "")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = ""
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    public override func setupViews() {
        super.setupViews()
        
        addSubview(pageImageView)
        addSubview(textView)
        
        pageImageView.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.anchorWithConstantsToTop(pageImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
    }
}
