//
//  AEPTemplate.swift
//  AEPTemplate
//
//  Created by Pravin Prakash Kumar on 9/4/24.
//

import Foundation

public protocol AEPTemplate {}

public class LargeImageTemplate : AEPTemplate {
    var data: [String : Any]
    init(data: [String : Any]) {
        self.data = data
    }
}


public class SmallImageTemplate : AEPTemplate {
    var data: [String : Any]
    init(data: [String : Any]) {
        self.data = data
    }
}
