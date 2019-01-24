# NibBased
A micro-framework that helps to handle xib/nib based layout. If you prefer to avoid usage of storyboards in your project, this few classes will help you organized your view related part of the code. 

# Basic assumption
The basic assumption for this framework is to have nib (xib) file with the same name as class. So if you have `YouViewController` class the corresponding xib file will be named `YouViewController.xib`. This rule is also valid for `UIView`, `UITableViewCell` and `UICollectionViewCell` subclasses. 

# Usage
There are a few ways to use this library. The most popular is to use `NibBaseViewController` as a basic class for other view controllers in your application. Firstly you have to create a view controller subclass using File -> New -> File menu in Xcode. Select `Cocoa Touch Class` and then set `Subclass of`  to `NibBaseViewController` and don't forget to select `Also create a XIB file`. In a newly created file, you have to add `import NibBased` so your file should look similar to:

```swift
import UIKit
import NibBased

class YourViewController: NibBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

```

and then in the place when you want to load your view controller write just:

```swift 

let viewController = YourViewController()

```
and it will load your layout from `YourViewController.xib` file.

# Installation

Use the [CocoaPods](http://github.com/CocoaPods/CocoaPods).

Add to your Podfile
>`pod 'NibBased'`

and then call

>`pod install`

and import 

>`import NibBased`
