//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Mors  on 01/02/24.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.share.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let share = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func tests_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.share
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func tests_load_requesteDataFromURL() {
        let client = HTTPClient.share
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
