//
//  View+ApplyIf.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

extension View {

    /// Conditionally applies the modifier to the view.
    @ViewBuilder
    func applyIf(
        _ condition: Bool,
        @ViewBuilder modifier: (Self) -> some View
    ) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }

}
