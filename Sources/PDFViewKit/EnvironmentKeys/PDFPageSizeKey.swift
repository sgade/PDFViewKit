//
//  PDFPageSizeKey.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

struct PDFPageSizeKey: EnvironmentKey {

    static var defaultValue: DIN = .a4

}

// MARK: - EnvironmentValues shorthand extension

public extension EnvironmentValues {

    var pdfPageSize: DIN {
        get { self[PDFPageSizeKey.self] }
        set { self[PDFPageSizeKey.self] = newValue }
    }

}

// MARK: - View extension

public extension View {

    /// Sets the ``PDFPageSizeEnvironmentKey`` to the given size value.
    ///
    /// This does not force the layout frame to be of the given size unless specificed.
    /// Unless you have a specific layout requirement, letting the renderer define the view's frame is usually what you
    /// want to do.
    ///
    /// - Parameters:
    ///     - size: The page size for the view and its descendants.
    ///     - force: Whether to apply the size to the view's frame.
    func pdfPageSize(
        _ size: DIN,
        force: Bool = false
    ) -> some View {
        environment(\.pdfPageSize, size)
            .applyIf(force) { $0.applyPDFSizeFrame(size: size) }
    }

}
