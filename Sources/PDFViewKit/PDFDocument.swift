//
//  PDFDocument.swift
//  PDFViewKit
//
//  Copyright (C) 2024 Sören Gade
//  See LICENSE for full license.
//

import SwiftUI

/// A collection of ``PDFPage``s.
public struct PDFDocument {

    public let pages: [PDFPage<AnyView>]

    public init(@PDFPagesBuilder _ pages: () -> [PDFPage<AnyView>]) {
        self.pages = pages()
    }

    init(pages: [PDFPage<AnyView>]) {
        self.pages = pages
    }

}

// MARK: Default page size for result builders

private extension PDFDocument {

    /// The default size used for pages implicitly created from views.
    static let defaultPageSize: PageSize = DIN.a4

}

// MARK: - PDFPagesBuilder

@MainActor
@resultBuilder
public enum PDFPagesBuilder {

    public static func buildPartialBlock(first: PDFPage<some View>) -> [PDFPage<AnyView>] {
        [PDFPage(erasing: first)]
    }

    public static func buildPartialBlock(
        accumulated: [PDFPage<AnyView>],
        next: PDFPage<some View>
    ) -> [PDFPage<AnyView>] {
        var pages = accumulated
        pages.append(PDFPage(erasing: next))
        return pages
    }

    public static func buildPartialBlock(first: some View) -> [PDFPage<AnyView>] {
        [PDFPage(
            size: PDFDocument.defaultPageSize,
            erasing: first
        )]
    }

    public static func buildPartialBlock(
        accumulated: [PDFPage<AnyView>],
        next: some View
    ) -> [PDFPage<AnyView>] {
        var pages = accumulated
        pages.append(PDFPage(
            size: PDFDocument.defaultPageSize,
            erasing: next
        ))
        return pages
    }

}

@MainActor
@resultBuilder
public enum PDFDocumentBuilder {

    public static func buildPartialBlock(first: PDFPage<some View>) -> PDFDocument {
        PDFDocument {
            first
        }
    }

    public static func buildPartialBlock(accumulated: PDFDocument, next: PDFPage<some View>) -> PDFDocument {
        var pages = accumulated.pages
        pages.append(PDFPage(erasing: next))
        return PDFDocument(pages: pages)
    }

    public static func buildPartialBlock(first: some View) -> PDFDocument {
        PDFDocument {
            PDFPage(size: PDFDocument.defaultPageSize) {
                first
            }
        }
    }

    public static func buildPartialBlock(accumulated: PDFDocument, next: some View) -> PDFDocument {
        var pages = accumulated.pages
        pages.append(PDFPage(
            size: PDFDocument.defaultPageSize,
            erasing: next
        ))
        return PDFDocument(pages: pages)
    }

}
