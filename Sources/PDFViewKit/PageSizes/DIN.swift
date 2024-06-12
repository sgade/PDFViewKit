//
//  DIN.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import Foundation

/// Defines standard page sizes in the german DIN system.
public enum DIN {

    // Source: https://de.wikipedia.org/wiki/Papierformat#Internationale_Papierformate_(ISO/DIN)

    case a0
    case a1
    case a2
    case a3
    case a4
    case a5
    case a6
    case a7
    case a8
    case a9
    case a10

}

// MARK: PageSize

extension DIN: PageSize {

    public var width: Measurement<UnitLength> {
        switch self {
        case .a0:
            Measurement(
                value: 841,
                unit: .millimeters
            )

        case .a1:
            Measurement(
                value: 594,
                unit: .millimeters
            )

        case .a2:
            Measurement(
                value: 420,
                unit: .millimeters
            )

        case .a3:
            Measurement(
                value: 297,
                unit: .millimeters
            )

        case .a4:
            Measurement(
                value: 210,
                unit: .millimeters
            )

        case .a5:
            Measurement(
                value: 148,
                unit: .millimeters
            )

        case .a6:
            Measurement(
                value: 105,
                unit: .millimeters
            )

        case .a7:
            Measurement(
                value: 74,
                unit: .millimeters
            )

        case .a8:
            Measurement(
                value: 52,
                unit: .millimeters
            )

        case .a9:
            Measurement(
                value: 37,
                unit: .millimeters
            )

        case .a10:
            Measurement(
                value: 26,
                unit: .millimeters
            )
        }
    }

    public var height: Measurement<UnitLength> {
        switch self {
        case .a0:
            Measurement(
                value: 1189,
                unit: .millimeters
            )

        case .a1:
            Measurement(
                value: 841,
                unit: .millimeters
            )

        case .a2:
            Measurement(
                value: 594,
                unit: .millimeters
            )

        case .a3:
            Measurement(
                value: 420,
                unit: .millimeters
            )
        case .a4:
            Measurement(
                value: 297,
                unit: .millimeters
            )

        case .a5:
            Measurement(
                value: 210,
                unit: .millimeters
            )

        case .a6:
            Measurement(
                value: 148,
                unit: .millimeters
            )

        case .a7:
            Measurement(
                value: 105,
                unit: .millimeters
            )

        case .a8:
            Measurement(
                value: 74,
                unit: .millimeters
            )

        case .a9:
            Measurement(
                value: 52,
                unit: .millimeters
            )

        case .a10:
            Measurement(
                value: 37,
                unit: .millimeters
            )
        }
    }

}
