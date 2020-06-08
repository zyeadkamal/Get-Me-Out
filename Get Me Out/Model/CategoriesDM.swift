//
//  CategoryDataModel.swift
//  Get Me Out
//
//  Created by zeyad on 6/6/20.
//  Copyright © 2020 Salah . All rights reserved.
//


import Foundation

// MARK: - Welcome
struct TypeCategory : Codable {
    let category: Category2
    let places: Places1
    let statusCode: Int
    let key: String

    enum CodingKeys: String, CodingKey {
        case category, places
        case statusCode = "status_code"
        case key
    }
}

// MARK: - Category
struct Category2: Codable {
    let id: Int
    let image, name, shortDesc: String
    let imageurl: String

    enum CodingKeys: String, CodingKey {
        case id, image, name
        case shortDesc = "short_desc"
        case imageurl
    }
}

// MARK: - Places
struct Places1: Codable {
    let currentPage: Int
    let data: [Datum1]
    let firstPageURL: String
    let from: Int?
    let lastPage: Int
    let lastPageURL, path: String
    let nextPageURL: String?
    let perPage: Int
    let prevPageURL: String?
    let to: Int?
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct Datum1: Codable {
    let id: Int
    let name: String
    let rateAvg: Double
    let numOfRater: Int
    let latitude, longitude: Double
    let shortDesc, address: String
    let imageurl: String
    let isbookmarked: Int
    let dashboardurl: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case rateAvg = "rate_avg"
        case numOfRater = "num_of_rater"
        case latitude, longitude
        case shortDesc = "short_desc"
        case address, imageurl, isbookmarked, dashboardurl
    }
}

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}





