//
//  RenderingEnvironmentKey.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

public extension EnvironmentValues {

    @Entry
    var renderingEnvironment: RenderingEnvironment = .default

}

// MARK: - RenderingEnvironment values

public enum RenderingEnvironment {

    case `default`
    case toPDF

}
