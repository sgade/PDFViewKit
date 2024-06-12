# PDFViewKit

Create PDF files using SwiftUI views.

## Usage

First, define the views that make up the content of your PDF. Since PDF pages are fixed size, you need to make sure
that your content fits your page size.

```swift
import SwiftUI

struct MyPDFContent: View {
    
    var body: some View {
        Text("Hello, World")
    }
    
}
```

Then, use the `render(document:to:atPageSize:)` function on `PDFRenderer`.
This function expects a `PDFDocument` which can be created by passing it a set of views that each make up a single page.

```swift
let document = PDFDocument {
    MyPDFContent()
}

do {
    try PDFRenderer.render(
        document: document,
        at: destination,
        atPageSize: .a4
    )
} catch {
    ...
}
```

That's it! Your PDF file will be generated into the given `destination` URL.

## Important notes

SwiftUI is a framework for creating dynamic user interfaces. PDFs are not dynamic and their pages have a fixed size.
Therefore, no interactivity is possible in your views, and using certain property wrappers will generate runtime
 warnings since the views are not part of any view hierarchy in a scene.

Interactive views are not rendered with their default look. Instead, they will appear as a red crossed out area.
For these views, you will need to provide a non-interactive view that mimics the original view's appearance.

The following alternative views are already provided:

- [`Link`](https://developer.apple.com/documentation/swiftui/link): `PDFLink`

### Implementing your own PDF-compatible views

To create views that react to being rendered into a PDF file, you can use the `@Environment(\.renderingEnvironment)` to
determine if the view is currently being rendered into a PDF. This allows you to switch out the implementation of your
view, and make it interactive if used inside of an actual application window hierarchy.

Similarly, you can get the PDF rendering DPI using `@Environment(\.pdfRenderingDPI)`.
The PDF's page size is provided using `@Environment(\.pdfPageSize)`.
