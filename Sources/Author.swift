//
//  Author.swift
//  JSON Feed Parser
//
//  Created by Mark Malstrom on 5/28/17.
//
//

import Foundation
import SimpleJSONKit

public struct Author {
    /// The author’s name.
    public let name: String?
    /// The URL of a site owned by the author.
    public let url: URL?
    /// The URL for an image for the author.
    ///
    /// It should be square and relatively large — such as 512 x 512 —
    /// and should use transparency where appropriate,
    /// since it may be rendered on a non-white background.
    public let avatar: URL?
}

extension Author: JSONDeserializable {
    public init(jsonRepresentation json: JSONDictionary) throws {
        self.name = try? decode(json, key: "name")
        self.url = try? decode(json, key: "url")
        self.avatar = try? decode(json, key: "avatar")
    }
}
