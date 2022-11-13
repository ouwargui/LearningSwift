//
//  AddView.swift
//  learning
//
//  Created by Guilherme Santos on 12/11/22.
//

import SwiftUI

struct AddView: View {
  @Environment(\.dismiss) var dismissModal
  @ObservedObject var expenses: Expenses

  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = 0.0

  let types = ["Business", "Personal"]

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)

        Picker("Type", selection: $type) {
          ForEach(types, id: \.self) {
            Text($0)
          }
        }
        TextField("Amount", value: $amount, format: .currency(code: "USD"))
          .keyboardType(.decimalPad)
      }
      .navigationTitle("Add new expense")
      .toolbar {
        Button("Save") {
          let item = ExpenseItem(name: name, type: type, amout: amount)
          expenses.items.append(item)
          dismissModal()
        }
      }
    }
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}
