//
//  Attachment.swift
//  JSON Feed Parser
//
//  Created by Mark Malstrom on 5/28/17.
//
//

import Foundation
import JSON

public struct Attachment {
    /// Specifies the location of the attachment.
    public let url: URL
    /// Specifies the type of the attachment, such as `"audio/mpeg"`.
    public let mimeType: String
    /// A name for the attachment.
    ///
    /// **Important:** if there are multiple attachments, and two or more have the exact same title
    /// (when title is present), then they are considered as alternate representations of the same thing.
    ///
    /// In this way a podcaster, for instance, might provide an audio recording in different formats.
    public let title: String?
    /// Specifies how large the file is
    public let sizeInBytes: Int?
    /// Specifies how long it takes to listen to or watch, when played at normal speed.
    public let durationInSeconds: Int?
}

extension Attachment: JSONDeserializable {
    public init(jsonRepresentation json: JSONDictionary) throws {
        self.url = try decode(json, key: "url")
        self.mimeType = try decode(json, key: "mime_type")
        self.title = try? decode(json, key: "title")
        self.sizeInBytes = try? decode(json, key: "size_in_bytes")
        self.durationInSeconds = try? decode(json, key: "duration_in_seconds")
    }
}
