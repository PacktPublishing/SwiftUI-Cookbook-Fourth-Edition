//
//  SampleArticle.swift
//  MarkdownPress
//
//  Created by Juan Catalan on 8/29/26.
//

import Foundation

enum SampleArticle {
  static let markdown = """
    # Meet Jost

    Jost is a *geometric* sans-serif typeface designed by Owen Earl and
    published by **indestructible type** under the SIL Open Font License.
    Its round letters and even strokes echo the German typefaces of the
    1920s, which makes it a good fit for headings, captions and short
    articles like this one.

    ## Using it in an app

    Bundling a font takes three steps:

    - Add the `.ttf` files to the project.
    - List them under `UIAppFonts` in the `Info.plist` file.
    - Load them with `Font.custom(_:size:relativeTo:)`.

    The typeface is free to use. See the
    [Jost project on GitHub](https://github.com/indestructible-type/Jost)
    for the complete family and its license.
    """
}
