//
//  ApplyPDFSizeFrameModifier.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

private struct ApplyPDFSizeFrameModifier: ViewModifier {

    public let size: DIN

    @Environment(\.pdfRenderingDPI)
    private var pdfRenderingDPI

    func body(content: Content) -> some View {
        content
            .frame(
                width: size.size(atDPI: pdfRenderingDPI).width,
                height: size.size(atDPI: pdfRenderingDPI).height
            )
    }

}

// MARK: - View extension

extension View {

    /// Applies the given PDF size to the view's frame, taking the current DPI setting into account.
    ///
    /// - Seealso: ``PDFRenderingDPIEnvironmentKey``
    func applyPDFSizeFrame(size: DIN) -> some View {
        modifier(ApplyPDFSizeFrameModifier(size: size))
    }

}
