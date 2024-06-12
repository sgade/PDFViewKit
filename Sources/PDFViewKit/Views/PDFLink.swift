//
//  PDFLink.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

public struct PDFLink<Title: View>: View {

    public let title: Title

    public let destination: URL

    @Environment(\.renderingEnvironment)
    private var renderingEnvironment

    public init(destination: URL) where Title == Text {
        guard let components = URLComponents(url: destination, resolvingAgainstBaseURL: false),
              let host = components.host
        else {
            fatalError("Could not get components of url: \(destination)")
        }
        let title = "\(host)\(components.path)"
        self.init(
            title,
            destination: destination
        )
    }

    public init<S>(
        _ title: S,
        destination: URL
    ) where S: StringProtocol, Title == Text {
        self.init(destination: destination) {
            Text(title)
        }
    }

    private init(
        destination: URL,
        @ViewBuilder title: () -> Title
    ) {
        self.title = title()
        self.destination = destination
    }

    public var body: some View {
        switch renderingEnvironment {
        case .default:
            Link(
                destination: destination,
                label: { title }
            )

        case .toPDF:
            title
        }
    }

}

// MARK: - Previews

#Preview {
    PDFLink("Preview", destination: URL(string: "https://www.sgade.de")!)
}
