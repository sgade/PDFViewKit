//
//  RenderingEnvironmentKey.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

public struct RenderingEnvironmentKey: EnvironmentKey {

    public static var defaultValue: RenderingEnvironment = .default

}

// MARK: - EnvironmentValues shorthand extension

public extension EnvironmentValues {

    var renderingEnvironment: RenderingEnvironment {
        get { self[RenderingEnvironmentKey.self] }
        set { self[RenderingEnvironmentKey.self] = newValue }
    }

}

// MARK: - RenderingEnvironment values

public enum RenderingEnvironment {

    case `default`
    case toPDF

}
