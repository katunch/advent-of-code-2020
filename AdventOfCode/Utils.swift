//
//  Utils.swift
//  AdventOfCode
//
//  Created by katunch on 07.12.20.
//

import Foundation

extension String {
    var lines: [String] {
        return self.split(separator: "\n").map { String($0) }
    }
}
