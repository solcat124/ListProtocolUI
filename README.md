# About

Example SwiftUI code to manage a list on macOS. 

Supported user actions:
- Selection. Arrow keys and mouse clicks can be used to change which item in the list is selected. (The selected list is highlighted.)
- Add an item. An *add* button appears in the list, which when clicked adds a row to the list.
- Rename an item. Clicking on the name of a list item allows the name to be edited.
- Rearrange the order. Dragging and moving lines reorders the list.
- Delete an item. Using the backspace or delete key will remove a selected item. Using control-right-click deletes the item where the click takes place, which may differ from the selected item.

# Implmentation
Protocols are defined for a list and a row in a list, primarily to identify support for user actions.

Makes use of the Swift-specific implementation of the observer design pattern, [Observation](https://developer.apple.com/documentation/Observation), to track changes to a list.
