//
//  PDFPage.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

/// Defines a standardized frame container for a page.
///
/// Views that exceed the page's bounds will be clipped.
/// The alignment of the page's content is top leading.
public struct PDFPage<Content: View>: View {

    public let size: DIN

    public let content: Content

    public init(
        size: DIN = .a4,
        @ViewBuilder _ content: () -> Content
    ) {
        self.size = size
        self.content = content()
    }

    public var body: some View {
        content
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            // setting the aspect ratio here to ensure the correct one is present at render time.
            // the actual size (and therefore scale factor) will be determined at render time
            .aspectRatio(
                size.aspectRatio,
                contentMode: .fit
            )
            .pdfPageSize(size)
    }

}

// MARK: Type-erasing views

public extension PDFPage where Content == AnyView {

    init(erasing otherPage: PDFPage<some View>) {
        self.init(size: otherPage.size) {
            AnyView(erasing: otherPage.content)
        }
    }

    init(erasing view: some View) {
        self.init(erasing: PDFPage({ AnyView(erasing: view) }))
    }

}

// MARK: - Previews

#Preview {
    PDFPage {
        Text("Hello, World")
    }
}
