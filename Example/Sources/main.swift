import SwiftUI
import PDFViewKit

struct MyPDFContent: View {

    var body: some View {
        Text("Hello, World")
    }

}

let destination = FileManager.default.temporaryDirectory.appending(path: "MyPDF.pdf")

let document = PDFDocument {
    MyPDFContent()
}

do {
    try PDFRenderer.render(
        document: document,
        to: destination,
        atPageSize: .a4
    )

    print("PDF written to \(destination.absoluteString).")
} catch {
    print("Failed to render PDF: \(error)")
}
