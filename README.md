# JSONFeedKit

A JSON Feed wrapper written in pure Swift. For more information on JSON Feeds, see the [JSON Feed specification](https://jsonfeed.org/version/1).

## Usage

Usage examples can be found in `Tests/JSONFeedKitTests.playground`. A quick summary here:

```swift
import JSONFeedParser

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

You may want to write a parser for extracting a JSON Feed URL from an HTML page. For that, I recoment using [`Ji`](https://github.com/honghaoz/Ji).

## Installation

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `JSONFeedKit` by adding it to your `Podfile`:

```ruby
pod 'JSONFeedKit'
```