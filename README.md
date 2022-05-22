# TodoList

MyTodoList is a Todo app with local authentication and UserDefaults as a database.

### Getting started

#### Requirements
1. Xcode 13 or higher
2. iOS 15 or higher

#### How to install
1. Fork the repo
2. Clone the repo
3. Run `MyTodo.xcodeproj` file

### General Notes

#### Views
All views are written in SwiftUI and placed in `Views` catalogue.

#### Alert messages
The text can be found in `TodoError`, `LoginError` and `TodoError` enums, you can use these to assert the contents of the alerts.

### Tasks

Create automated UI tests for the following scenarios:

    1. Create Account
        * Username cannot be empty
        * Password cannot be empty
        * Password and Repeat Password do not match
        * Username is already taken
        * Create account with success
    2. Login
        * Username cannot be empty
        * Password cannot be empty
        * Authentication failed
    3. Add new todo
        * Title cannot be empty
        * Add new todo from "Add something" button
        * Add new todo from "Add" button
    4. TodoList
        * Text when no todos are available    
        * Mark Todo as done (tap on the todo)
        * Todo is not done
        * Delete Todo (swipe to delete)
    5. Extra task
        * Add possibility for clearing test data by using `LaunchArguments.append("clearLocalData")` parameter in tests
        
Finally feel free to modify the existing code. The application is for you.

## Copyright
MIT License.
Created by @DawidBastek and @matulik
