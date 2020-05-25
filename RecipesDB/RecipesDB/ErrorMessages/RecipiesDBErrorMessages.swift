//
//  RecipiesDBErrorMessages.swift
//  RecipesDB
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

enum RecipiesDBErrorMessages: Error {
    case emptySearchResponse
    case emptySearchCriteria
}

extension RecipiesDBErrorMessages: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptySearchResponse:
            return "Couldn't find any recipe for that ingredient!"
        case .emptySearchCriteria:
            return "Search criteria can't be empty"
        }
    }
}
