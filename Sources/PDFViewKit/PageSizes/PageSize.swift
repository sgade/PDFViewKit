//
//  PageSize.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import Foundation

/// A type that defines page sizes.
public protocol PageSize {
    
    /// The page's physical width.
    var width: Measurement<UnitLength> { get }

    /// The page's physical height.
    var height: Measurement<UnitLength> { get }

    /// The page's size aspect ratio.
    var aspectRatio: CGFloat { get }

    /// Calculates the page's dot size at the given ``DPI`` rendering scale.
    ///
    /// - Parameters:
    ///     - dpi: The page resolution of dots per inch.
    func size(atDPI dpi: DPI) -> CGSize

}

// MARK: Default implementation

public extension PageSize {

    var aspectRatio: CGFloat {
        width.converted(to: .millimeters).value / height.converted(to: .millimeters).value
    }

    func size(atDPI dpi: DPI) -> CGSize {
        CGSize(
            width: width.converted(to: .inches).value * dpi.rawValue,
            height: height.converted(to: .inches).value * dpi.rawValue
        )
    }

}
