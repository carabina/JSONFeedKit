# JSONFeedKit

A JSON Feed wrapper written in pure Swift. For more information on JSON Feeds, see the [JSON Feed specification](https://jsonfeed.org/version/1).

## Usage

Usage examples can be found in `Tests/JSONFeedKitTests.playground`. A quick summary here:

```swift
import JSONFeedKit

let requestURL = URL(string: "https://daringfireball.net/feeds/json")!
let urlRequest = URLRequest(url: requestURL)
let session = URLSession(configuration: .default)
let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
    let json = try! JSONSerialization.jsonObject(with: data!, options: [])
    let feed = try! Feed(jsonRepresentation: json as! [String : Any])

    // Use `feed` and its properties in this callback.
    
})
task.resume()
```

You may want to write a parser for extracting a JSON Feed URL from an HTML page. For that, I recomend using [`Ji`](https://github.com/honghaoz/Ji).

## Installation

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `JSONFeedKit` by adding it to your `Podfile`:

```ruby
pod 'JSONFeedKit'
```

#### Carthage
Create a `Cartfile` and add `JSONFeedKit` to it. Follow these [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) for using Carthage with an iOS project.

```swift
github "roonieone/JSONFeedKit"
```

#### Swift Package Manager
Create a new directory where you want your project to live. Use `swift package init --type executable` to create set up your package. In your new `Package.swift` add the following:

```swift
import PackageDescription

let package = Package(
   name: "Project Name",
   dependencies: [
      .Package(url: "https://github.com/roonieone/JSONFeedKit.git", "0.1.2")
   ]
)
```

Then use `swift package fetch` to download the `JSON` dependency and `swift package generate-xcodeproj` to create an Xcode Project. For more information on how to use Swift Package Manager with iOS, [see this gist](https://gist.github.com/nathanborror/4ecb16bcb1ae0bd11e7eed043c6cd8bd).