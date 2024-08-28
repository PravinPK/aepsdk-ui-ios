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
import AEPSwiftUI
import SwiftUI
import AEPMessaging

struct PDFPage: View {
    @State var savedCards : [ContentCardUI] = []
    
    var body: some View {
        VStack {
            Text("PDF Page Cards")
            LazyVStack {
                ForEach(savedCards) { card in
                    card.view
                        .frame(width: 320, height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                               .stroke(Color(.systemGray3), lineWidth: 1))
               }
            }
        }.onAppear() {
            getContentCard()
        }
    }
    
    private func getContentCard() {
        let pdfPageSurface = Surface(path: "pdfpage")
        AEPSwiftUI.getContentCardsUI(for: pdfPageSurface,
                                     customizer: PDFPageCardCustomizer()) { result in
            switch result {
            case .success(let cards):
                savedCards = cards
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

class PDFPageCardCustomizer : ContentCardCustomizing {
    
    func customize(template: SmallImageTemplate) {
        // customize UI elements
        template.title.font = .subheadline
        template.body?.font = .system(.caption, weight: .light)
        
        // customize stack structure
        template.rootHStack.spacing = 10
        template.textVStack.spacing = 5
        
        // add custom modifiers
        template.rootHStack.modifier = AEPViewModifier(RootHStackModifier())
        template.image?.modifier = AEPViewModifier(ImageModifier())
    }
    
    struct RootHStackModifier : ViewModifier {
        func body(content: Content) -> some View {
             content
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing)
         }
    }
    
    struct ImageModifier : ViewModifier {
        func body(content: Content) -> some View {
             content
                .padding([.top, .bottom, .leading], 15)
         }
    }
}
