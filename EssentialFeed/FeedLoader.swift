//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Gabriel Mors  on 26/01/24.
//

import Foundation

enum FeedLoaderResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {

    func loadFeed(completion: @escaping (FeedLoaderResult) -> Void)
    
}

