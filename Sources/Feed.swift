//
//  Feed.swift
//  JSON Feed Parser
//
//  Created by Mark Malstrom on 5/28/17.
//
//

import Foundation
import SimpleJSONKit

public struct Feed {
    /// The URL of the version of the format the feed uses
    public let version: URL
    /// The version number of the version of the format the feed uses
    public let versionNumber: Int
    /// The name of the feed, which will often correspond to the name of the website
    public let title: String
    /// The URL of the resource that the feed describes
    public let homePageURL: URL?
    /// The URL of the feed
    public let feedURL: URL?
    /// Provides more detail, beyond the title, on what the feed is about
    public let description: String?
    /// A description of the purpose of the feed.
    ///
    /// This is for the use of people looking at the raw JSON,
    /// and should be ignored by feed readers.
    public let userComment: String?
    /// The URL of a feed that provides the next `n` items,
    /// where `n` is determined by the publisher. This allows for pagination.
    public let nextURL: URL?
    /// The URL of an image for the feed suitable to be used in a timeline,
    /// much the way an avatar might be used.
    public let icon: URL?
    /// The URL of an image for the feed suitable to be used in a source list.
    ///
    /// It should be square and relatively small, but not smaller than `64 x 64`.
    public let favicon: URL?
    /// Specifies the feed's `Author`.
    ///
    /// The author object has several properties, which are all optional —
    /// but if an author object is provided, then at least one property should be non-optional.
    public let author: Author?
    /// Whether or not the feed is finished — that is, whether or not it will ever update again.
    ///
    /// A feed for a temporary event, such as an instance of the Olympics, could expire.
    /// If the value is true, then it’s expired. Any other value, or the absence of expired,
    /// means the feed may continue to update.
    public let expired: Bool?
    /// Sescribes endpoints that can be used to subscribe to real-time notifications from the publisher of this feed.
    ///
    /// Each tuple in this array has a `type` and `url`, both of which are required.
    /// See "Subscribing to Real-time Notifications" on https://jsonfeed.org/version/1 for details.
    public let hubs: [(type: String, url: URL)]?
    /// An array of `Item` objects.
    public let items: [Item]
}

extension Feed: JSONDeserializable {
    public init(jsonRepresentation json: JSONDictionary) throws {
        self.version = try decode(json, key: "version")
        
        let range = self.version.absoluteString.range(of: "version/")!
        let versionNum = self.version.absoluteString.substring(from: range.upperBound)
        self.versionNumber = Int(versionNum)!
        
        self.title = try decode(json, key: "title")
        self.homePageURL = try? decode(json, key: "home_page_url")
        self.feedURL = try? decode(json, key: "feed_url")
        self.description = try? decode(json, key: "description")
        self.userComment = try? decode(json, key: "user_comment")
        self.nextURL = try? decode(json, key: "next_url")
        self.icon = try? decode(json, key: "icon")
        self.favicon = try? decode(json, key: "favicon")
        self.author = try? decode(json, key: "author")
        self.expired = try? decode(json, key: "expired")
        self.hubs = try? decode(json, key: "hubs")
        self.items = try decode(json, key: "items")
    }
}
