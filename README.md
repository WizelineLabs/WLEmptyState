# WLEmptyState

[![Build Status](https://travis-ci.com/wizeline/predictive-listening.svg?token=x5gYJeA2Y1cf76HyTTzK&branch=develop)](https://travis-ci.com/wizeline/predictive-listening)
[![Version](https://img.shields.io/cocoapods/v/WLEmptyState.svg?style=flat)](https://cocoapods.org/pods/WLEmptyState)
[![Twitter](https://img.shields.io/twitter/follow/theWizeline.svg?label=Wizeline%20&style=flat)](http://twitter.com/thewizeline)

## Table of Content <!-- omit in toc -->

- [Overview](#overview)
- [Running an Example Project](#running-an-example-project)
  - [Installing WLEmptyState](#installing-wlemptystate)
  - [Configuring WLEmptyState](#configuring-wlemptystate)
  - [Using WLEmptyState](#using-wlemptystate)
- [Customizing WLEmptyState](#customizing-wlemptystate)
- [Contributing to WLEmptyState](#contributing-to-wlemptystate)
- [Author](#author)
- [License](#license)

## Overview

WLEmptyState is an iOS based component that lets you customize the message when the dataset of `UITableView` is empty. We created a sample project with the WLEmptyState component to show how you can use it.

## Running an Example Project

To run the `Example` project:

1. Clone the repo with the following command:

    `git clone git@github.com:wizeline/WLEmptyState.git`

2. Move to the `Example` directory and run the following command:

    `pod install`

### Installing WLEmptyState

WLEmptyState is available through [CocoaPods](https://cocoapods.org). To install it, add the following command to your Podfile:

```ruby
pod 'WLEmptyState'
```

### Configuring WLEmptyState

The WLEmptyState component uses [Method Swizzling](https://nshipster.com/method-swizzling/). Therefore, to configure `WLEmptyState`, follow these steps:

1. Import the module in the `AppDelegate` class by adding `import WLEmptyState`.

2. Call the static method `configure()` on `application(_ application:, didFinishLaunchingWithOptions:)` method.

    Your `AppDelegate` class should look like this:

    ```Swift
    import WLEmptyState
        ...
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WLEmptyState.configure()
        return true
    }
    ```

### Using WLEmptyState

Once you have configured `WLEmptyState`, you can use it for your `UITableViewController`. You need to conform the `WLEmptyStateDataSource` protocol. For example,

```Swift
class YourTableViewController: UITableViewController, WLEmptyStateDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.emptyStateDataSource = self
    }

}
```

After you run your project with an empty dataset for a table, you'll be able to see a default `WLEmptyState` view.

**Default Image**

![Default WLEmptyState](https://user-images.githubusercontent.com/6756995/52525837-21b7cc00-2c75-11e9-8ef4-6c2ca226ddb3.png)

## Customizing WLEmptyState

If you want to customize the text, description, or image, you need to implement the `WLEmptyStateDataSource` function. You can find the code for customization in the following list:

- Customize Image

```Swift
func imageForEmptyDataSet() -> UIImage? {
    return UIImage(named: "bubble_icon")
}
```

- Customize Title

```Swift
func titleForEmptyDataSet() -> NSAttributedString {
    let title = NSAttributedString(string: "No messages", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    return title
}
```

- Customize Description

```Swift
func descriptionForEmptyDataSet() -> NSAttributedString {
    let title = NSAttributedString(string: "There's no messages to show.", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    return title
}
```

**Customized Image**

<img src="https://user-images.githubusercontent.com/3466367/52595877-8fe6c500-2e14-11e9-85f3-2937746d4b24.png" width="300">

## Contributing to WLEmptyState

We actively welcome your pull requests. We are trying to make contributing to this project as transparent and easy as possible. 
If you face any problem with the code, please open an issue on GitHub.

## Author

[Wizeline](https://www.wizeline.com) - iOS Team

## License

WLEmptyState is available under the MIT license. See the LICENSE file for more info.
