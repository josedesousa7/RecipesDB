//
//  TestErrors.swift
//  RecipesDBTests
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

enum TestErrors: Error {
    case parsingError
}

extension TestErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .parsingError:
            return "Parsing error: Recipies dont exist"
        }
    }
}
