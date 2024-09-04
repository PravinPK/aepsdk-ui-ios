//
//  AEPUIInteractionTracker.swift
//  AEPUIContentManager
//
//  Created by Pravin Prakash Kumar on 9/4/24.
//

import Foundation

protocol AEPUIInteractionTracker {
    func onDisplay()
    func onDismiss()
    func onInteract( interactID : String , url : URL)
}
