//
//  ExpenseItem.swift
//  learning
//
//  Created by Guilherme Santos on 12/11/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amout: Double
}
