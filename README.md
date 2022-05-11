# Culminating Task Code Snippets

This is a workspace to share small code examples, or *snippets*, that various students need to complete their culminating task.

These code snippets represent either:

* a technique that goes beyond reasonable expectations for a student in a Grade 11 course
* a simpler technique that while useful, was not previously shared this year

## Web View

![A web view is shown loaded as a small portion of a view, about a third of the height of the page. In In a second image a web view is shown where the entire view within the app is given over to showing the web page.](SupportingImages/webview.png)

Several students have made plans to show live web pages within their app. This, as opposed to simply using the [`Link` structure in SwiftUI](https://developer.apple.com/documentation/swiftui/link), which simply bumps the user over to the mobile Safari app to view the website.

See:

* [`PartialPageExampleView`](x-source-tag://wv_partial_page)
    * ... for an example of how to load a web view as just a smaller part an existing view
* [`FullPageExampleView`](x-source-tag://wv_full_page)
    * ... for an example of how to load a web view so that it takes up the entire screen
    
To use this within your own app, copy the contents of these groups into your own Xcode project:

* `Model`
    * `WebViewModel.swift`
* `Views`
    * `Helpers`
        * `WebViewContainer.swift`
        * `WebView.swift`

It is recommended that if these groups do not currently exist within your project, that you create them before copying these files over to your project.
