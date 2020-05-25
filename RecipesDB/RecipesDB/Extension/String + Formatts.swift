//
//  String + Formatts.swift
//  RecipesDB
//
//  Created by José Marques on 25/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

extension String {

    func removeWhiteSpaceFor(text: String) -> String {
        if(text.count < 2){
            var formattedString = text.trimmingCharacters(in: .whitespacesAndNewlines)
            formattedString = formattedString.replacingOccurrences(of: " ", with: "")
            return formattedString
        } else {
            return text
        }
    }

    func removeWhiteSpaces() -> String {
          var trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
          trimmedString = trimmedString.replacingOccurrences(of: " ", with: "")
          return trimmedString
      }
}
