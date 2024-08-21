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

import AEPMessaging
import SwiftUI

/// A base class for content card templates, providing common properties and initialization logic.
///
/// `BaseTemplate` serves as a foundational class for more specific content card templates.
/// It includes properties and methods that are shared across different template types, such as
/// the background color. This class is intended to be subclassed by specific template implementations
/// that define their own layout and content.
///
///
/// - Note: This class is not intended to be used directly. Instead, use one of its subclasses
///   that provide specific template implementations.
public class BaseTemplate: ObservableObject {
    /// The background color of the content card.
    /// Use this property to set the background color for the content card.
    @Published public var backgroundColor: Color?

    /// The URL that is intended to be opened when the content card is interacted with.
    var actionURL: URL?

    /// Initializes a `BaseTemplate` with the given schema data.
    /// This initializer is designed to be called by subclasses to perform common initialization tasks.
    /// - Parameter schemaData: The schema data used for initialization.
    init?(_ schemaData: ContentCardSchemaData) {
        self.actionURL = schemaData.actionUrl

        // TODO: Retrieve other common properties for all templated content cards
    }

    /// Constructs a SwiftUI view with common properties and behaviors applied for all templates.
    ///
    /// - Parameter content: A closure that returns the content view to be displayed.
    /// - Returns: A SwiftUI view of the templated Content Card
    func buildCardView<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content()
            .background(backgroundColor)
            .onTapGesture {
                // TODO: Handle card clicked action through a cardEventListener
            }
    }
}
