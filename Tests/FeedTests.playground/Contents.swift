//: Playground - noun: a place where people can play

import Cocoa
import JSONFeedParser
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let requestURL = URL(string: "https://daringfireball.net/feeds/json")!
let urlRequest = URLRequest(url: requestURL)
let session = URLSession(configuration: .default)
let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
    let json = try! JSONSerialization.jsonObject(with: data!, options: [])
    let feed = try! Feed(jsonRepresentation: json as! [String : Any])
    
    feed.version
    feed.versionNumber
    feed.title
    feed.homePageURL
    feed.feedURL
    feed.description
    feed.userComment
    feed.icon
    feed.favicon
    
    feed.author?.name
    feed.author?.url
    feed.author?.avatar
    
    for item in feed.items {
        item.title
        item.datePublished
        item.dateModified
    }
    
})
task.resume()