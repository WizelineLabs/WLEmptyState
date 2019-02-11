# WLEmptyState

[![Build Status](https://travis-ci.com/wizeline/predictive-listening.svg?token=x5gYJeA2Y1cf76HyTTzK&branch=develop)](https://travis-ci.com/wizeline/predictive-listening)
[![Version](https://img.shields.io/cocoapods/v/WLEmptyState.svg?style=flat)](https://cocoapods.org/pods/WLEmptyState)
[![Twitter](https://img.shields.io/twitter/follow/theWizeline.svg?label=Wizeline%20&style=flat)](http://twitter.com/thewizeline)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 1. Installation

WLEmptyState is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WLEmptyState'
```

## 2. Configuration
To be able to use `WLEmptyState`, since this solution uses [Method Swizzling](https://nshipster.com/method-swizzling/) in order setup the `UITableView` and load the initial values you have to import the module in the `AppDelegate Class` and call the static method `configure()` on `application(_ application:, didFinishLaunchingWithOptions:`) method.


```Swift
import WLEmptyState
...
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WLEmptyState.configure()
        return true
    }
```

## 3. Usage
Once you have configured `WLEmptyState`, you can use it for your `UITableViewController`. You just need to conform `WLEmptyStateDataSource`.

```Swift
class YourTableViewController: UITableViewController, WLEmptyStateDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.emptyStateDataSource = self
    }

}
```
After you run your project with an empty dataset for a table, you'll be able to see a default `WLEmptyState` view.

![Default WLEmptyState](https://user-images.githubusercontent.com/6756995/52525837-21b7cc00-2c75-11e9-8ef4-6c2ca226ddb3.png)

## 4. Customization
If you want to customize the strings or the image, you can implement `WLEmptyStateDataSource` functions by your own.

The image for the empty state view:
```Swift
func imageForEmptyDataSet() -> UIImage? {
    return UIImage(named: "bubble_icon")
}
```

The styled title for the empty state view:
```Swift
func titleForEmptyDataSet() -> NSAttributedString {
    let title = NSAttributedString(string: "No messages", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    return title
}
```

The styled description for the empty state view:
```Swift
func descriptionForEmptyDataSet() -> NSAttributedString {
    let title = NSAttributedString(string: "There's no messages to show.", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    return title
}
```
<img src="https://user-images.githubusercontent.com/3466367/52595877-8fe6c500-2e14-11e9-85f3-2937746d4b24.png" width="300">

## Author
[Wizeline](https://www.wizeline.com) - iOS Team

## License

WLEmptyState is available under the MIT license. See the LICENSE file for more info.
