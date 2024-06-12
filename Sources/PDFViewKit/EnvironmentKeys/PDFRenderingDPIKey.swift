//
//  PDFRenderingDPIKey.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

struct PDFRenderingDPIKey: EnvironmentKey {

    static var defaultValue: DPI = .display

}

// MARK: - EnvironmentValues shorthand extension

public extension EnvironmentValues {

    var pdfRenderingDPI: DPI {
        get { self[PDFRenderingDPIKey.self] }
        set { self[PDFRenderingDPIKey.self] = newValue }
    }

}
