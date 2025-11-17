//
//  PDFRenderingDPIKey.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

public extension EnvironmentValues {

    @Entry
    var pdfRenderingDPI: DPI = .display
}
