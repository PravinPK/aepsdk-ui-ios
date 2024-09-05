/*
 Copyright 2024 Adobe. All rights reserved.
 This file is licensed to you under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License. You may obtain a copy
 of the License at http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software distributed under
 the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
 OF ANY KIND, either express or implied. See the License for the specific language
 governing permissions and limitations under the License.
 */

import Foundation
import UIKit
import AEPCore
import AEPMessaging
import AEPEdge
import AEPEdgeConsent
import AEPEdgeIdentity
import AEPAssurance

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let extensions = [
                          Messaging.self,
                          Edge.self,
                          Consent.self,
                          Identity.self,
                          Assurance.self
                        ]
        MobileCore.registerExtensions(extensions, {
            MobileCore.configureWith(appId: "staging/1b50a869c4a2/5f4ddd10a050/launch-bd5dd917b88c")
            MobileCore.updateConfigurationWith(configDict: ["edge.environment": "int"])
        })
        
        // STEP : 1
        // Download the cards using Messaging API
        let homePageSurface = Surface(path: "homepage")
        let pdfPageSurface = Surface(path: "pdfpage")
        let southwestSurface = Surface(path: "southwestCards")
        Messaging.updatePropositionsForSurfaces([homePageSurface, pdfPageSurface, southwestSurface])
                
        MobileCore.setLogLevel(.trace)
        return true 
    }
}
