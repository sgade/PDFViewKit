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

// MARK: - PDFPagesBuilder

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
        [PDFPage(erasing: first)]
    }

    public static func buildPartialBlock(
        accumulated: [PDFPage<AnyView>],
        next: some View
    ) -> [PDFPage<AnyView>] {
        var pages = accumulated
        pages.append(PDFPage(erasing: next))
        return pages
    }

}

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
            PDFPage {
                first
            }
        }
    }

    public static func buildPartialBlock(accumulated: PDFDocument, next: some View) -> PDFDocument {
        var pages = accumulated.pages
        pages.append(PDFPage(erasing: next))
        return PDFDocument(pages: pages)
    }

}
