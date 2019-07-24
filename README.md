![WLEmptyState_Banner](https://user-images.githubusercontent.com/6756995/55449438-bf01f300-5588-11e9-9c0d-dd48bd5babb4.png)
[![Build Status](https://travis-ci.org/wizeline/WLEmptyState.svg?branch=develop)](https://travis-ci.org/wizeline/WLEmptyState)
[![Version](https://img.shields.io/cocoapods/v/WLEmptyState.svg?style=flat)](https://cocoapods.org/pods/WLEmptyState)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/twitter/follow/theWizeline.svg?label=Wizeline%20&style=flat)](http://twitter.com/thewizeline)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

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

WLEmptyState is an iOS based component that lets you customize the message when the dataset of `UITableView` or `UICollectionView` is empty. We created a sample project with the WLEmptyState component to show how you can use it.

## Running an Example Project

To run the `Example` project:

1. Clone the repo with the following command:

    `git clone git@github.com:wizeline/WLEmptyState.git`

2. Move to the `Example` directory and run the following command:

    `pod install`

### Installing WLEmptyState

#### CocoaPods

WLEmptyState is available through [CocoaPods](https://cocoapods.org). To install it, add the following command to your Podfile:

```ruby
pod 'WLEmptyState'
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate WLEmptyState into your Xcode project using Carthage, specify it in your Cartfile:

```ruby
github "wizeline/WLEmptyState"
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

Once you have configured `WLEmptyState`, you can use it for your `UITableViewController` or `UICollectionViewController`. You need to conform the `WLEmptyStateDataSource` protocol. For example,

```Swift
class YourTableViewController: UITableViewController, WLEmptyStateDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.emptyStateDataSource = self
    }

}
```

After you run your project with an empty dataset for your entity, you'll be able to see a default `WLEmptyState` view.

**Default Image**

![Default WLEmptyState](https://user-images.githubusercontent.com/6756995/52525837-21b7cc00-2c75-11e9-8ef4-6c2ca226ddb3.png)

## Customizing Default WLEmptyState
If you want to customize the text, description, or image, of the defatult component you need to implement the `WLEmptyStateDataSource` function. You can find the code for customization in the following list:

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

## Creating your own EmptyState
Using `customViewForEmptyState()` allows you to provide your own implementation for Empty State.

```Swift
func customViewForEmptyState() -> UIView? {
  let activityIndicatorView = UIActivityIndicatorView()
  activityIndicatorView.startAnimating()
  activityIndicatorView.color = .purple
  return activityIndicatorView
}
```
![Simulator Screen Shot - iPhone X - 2019-07-24 at 16 07 43](https://user-images.githubusercontent.com/6756995/61828904-62735e00-ae2d-11e9-8020-2014ac3bfb17.png)

## Contributing to WLEmptyState

We actively welcome your pull requests. We are trying to make contributions to this project as transparent and accessible as possible, please read our [Contributing guidelines](contributing.md) and follow the [Code of conduct](CODE_OF_CONDUCT.md).
If you face any problem with the code, please open an issue on GitHub.

List of [Contributors](https://github.com/wizeline/WLEmptyState/graphs/contributors). ⭐️

## License

WLEmptyState is available under the MIT license. See the LICENSE file for more info.
