//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Gabriel Mors  on 01/02/24.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.share.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var share = HTTPClient()
    
    func get(from url: URL) {}
    
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
    
     var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func tests_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.share = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func tests_load_requesteDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.share = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
