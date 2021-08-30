//
//  Page.swift
//  Pagie
//
//  Created by Elser_10 on 3/25/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import Foundation

public struct Page {
    public var title: String?
    public var subtitle: String?
    public var imageName: String?
    
    public init(title: String?, subtitle: String?, imageName: String?) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
}
