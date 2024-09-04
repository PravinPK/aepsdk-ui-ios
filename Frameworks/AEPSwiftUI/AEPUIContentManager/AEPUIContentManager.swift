//
//  AEPUIContentManager.swift
//  AEPUIContentManager
//
//  Created by Pravin Prakash Kumar on 9/4/24.
//

import Foundation
import AEPTemplate

protocol AEPUIContentManager {
    func getContent() -> [AEPTemplate]
    func getInteractionTracker() -> AEPUIInteractionTracker
}
