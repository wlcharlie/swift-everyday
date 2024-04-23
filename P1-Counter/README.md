# P1 Counter

## What I learned

### Code

- `mutating` keyword is NOT used in SwiftUI's `View` protocol. It is typically used in methods within regular `Struct` (or other context like `enum`, `protocol`, `extension`)
- The property wrapper `@State` is used in SwiftUI to the framework know the value of the property can change, and the view needs to be updated(re-rendered) when it does.
- `Int.random(in: Range<Self>)` will gen random number in the range.

### UI

- To add a title on the top of view: use `NavigationStack` with the `.navigationTitle` modifier.
- To center the `.navigationTitle`: use the `.navigationBarTitleDisplayMode(.inline)` modifier
  ```swift
    NavigationStack {
      //content
      .navigationTitle("title")
      .navigationBarTitleDisplayMode(.inline)
    }
  ```
- To add a item(or button) on the toolbar: using `NavigationStack`, `.toolbar` and `ToolbarItem`. The default position is top-right of the view.
  (There are also positions available at the bottom of the view)

  ```swift
  .toolbar {
    ToolbarItem(placement: .topBarLeading) {
      //content
    }
  }
  ```
