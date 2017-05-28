//
//  Item.swift
//  JSON Feed Parser
//
//  Created by Mark Malstrom on 5/28/17.
//
//

import Foundation
import JSON

public struct Item {
    /// The unique ID for the item for the feed over time.
    ///
    /// If an item is ever updated, `id` is unchanged.
    /// New `Item`s will never use a previously-used `id`.
    public let id: String
    /// The URL of the resource described by the item.
    ///
    /// It’s the permalink.
    public let url: URL?
    /// The URL of a page elsewhere.
    ///
    /// This is especially present in linkblogs.
    /// If `url` links to where the item is talking about a thing, then externalURL
    /// links to the thing that's being talked about.
    public let externalURL: URL?
    /// The title of the item.
    public let title: String?
    /// The contents of the item in HTML.
    ///
    /// contentText is optional but either contentText or contentHTML must be present.
    public let contentHTML: String?
    /// The contents of the item in plain text.
    ///
    /// contentText is optional but either contentText or contentHTML must be present.
    public let contentText: String?
    /// A plain text sentence or two describing the item.
    public let summary: String?
    /// The URL of the main image for the item.
    ///
    /// This image may also appear in the contentHTML —
    /// if so, it’s a hint to the feed reader that this is the main, featured image.
    ///
    /// Feed readers may use the image as a preview (probably resized as a thumbnail and placed in a timeline).
    public let image: URL?
    /// The URL of an image to use as a banner.
    ///
    /// Some blogging systems display a different banner
    /// image chosen to go with each post, but that image wouldn’t otherwise
    /// appear in the contentHTML.
    ///
    /// A feed reader with a detail view may choose to show this banner image
    /// at the top of the detail view, possibly with the title overlaid.
    public let bannerImage: URL?
    /// Specifies the date published.
    public let datePublished: Date?
    /// Specifies the modification date.
    public let dateModified: Date?
    /// The author for this item.
    ///
    /// If not specified on an item, then the top-level author, if present, is the author of the item.
    public let author: Author?
    /// Tags for the item. Can have any plain text values.
    ///
    /// Tags tend to be just one word, but they may be anything.
    /// Note: they are not the equivalent of Twitter hashtags.
    /// Some blogging systems and other feed formats call these categories.
    public let tags: [String]?
    /// Related resources.
    ///
    /// Podcasts, for instance, would include an attachment that’s an audio or video file.
    public let attachments: [Attachment]?
}

extension Item: JSONDeserializable {
    public init(jsonRepresentation json: JSONDictionary) throws {
        self.id = try decode(json, key: "id")
        self.url = try? decode(json, key: "url")
        self.externalURL = try? decode(json, key: "external_url")
        self.title = try? decode(json, key: "title")
        self.contentHTML = try? decode(json, key: "content_html")
        self.contentText = try? decode(json, key: "content_text")
        self.summary = try? decode(json, key: "summary")
        self.image = try? decode(json, key: "image")
        self.bannerImage = try? decode(json, key: "banner_image")
        self.datePublished = try? decode(json, key: "date_published")
        self.dateModified = try? decode(json, key: "date_modified")
        self.author = try? decode(json, key: "author")
        self.tags = try? decode(json, key: "tags")
        self.attachments = try? decode(json, key: "attachments")
    }
}
