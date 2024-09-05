//
//  SouthwestPage.swift
//  AEPSwiftUITestApp
//
//  Created by Pravin Prakash Kumar on 9/4/24.
//

import Foundation
import AEPSwiftUI
import SwiftUI
import AEPMessaging

struct SouthwestPage: View {
    @State var savedCards : [ContentCardUI] = []
    
    var body: some View {
        VStack {
            Spacer()
            LazyVStack {
                ForEach(savedCards) { card in
                    card.view
                        .frame(width: 360, height: 130)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                               .stroke(Color(.systemGray3), lineWidth: 1))
               }
            }
            Spacer()
        }.background(Color(hex: 0x273d8e))
        .onAppear() {
            getContentCard()
        }
    }
    
    private func getContentCard() {
        let southwestSurface = Surface(path: "southwestCards")
        AEPSwiftUI.getContentCardsUI(for: southwestSurface,
                                     customizer: SouthwestCardCustomizer()) { result in
            switch result {
            case .success(let cards):
                savedCards = cards
                
            case .failure(let error):
                print(error)
                
            }
        }
        
        ForEach(savedCards) { card in
            card.view.background(Color(hex: 0x2043c2))
       }
    }
    

}

class SouthwestCardCustomizer : ContentCardCustomizing {
    
    func customize(template: SmallImageTemplate) {
        // customize UI elements
        template.title.font = .custom("Helvetica", size: 18)
        template.title.textColor = .white
        template.title.modifier = AEPViewModifier(TitleModifier())
        
        template.body?.textColor = .white
        template.body?.modifier = AEPViewModifier(BodyModifier())
        
        template.buttons?.first?.modifier = AEPViewModifier(ButtonModifier())
        template.buttons?.first?.text.textColor = Color(hex: 0xf3c829)
        
        // customize stack structure
        template.rootHStack.spacing = 10
        
        // add custom modifiers
        template.rootHStack.modifier = AEPViewModifier(RootHStackModifier())
    }
    
    struct RootHStackModifier : ViewModifier {
        func body(content: Content) -> some View {
             content
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing)
         }
    }
    
    // Modifier for the title
    struct TitleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
    }

    // Modifier for the body
    struct BodyModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom("Helvetica", size: 14))
        }
    }
    
    // Modifier for the  button
    struct ButtonModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom("Helvetica", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}
