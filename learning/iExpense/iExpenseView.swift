//
//  iExpenseView.swift
//  learning
//
//  Created by Guilherme Santos on 12/11/22.
//

import SwiftUI

struct iExpenseView: View {
  @StateObject var expenses = Expenses()
  @State private var showingAddExpense = false

  var body: some View {
    List {
      ForEach(expenses.items) { item in
        HStack {
          VStack(alignment: .leading) {
            Text(item.name)
              .font(.headline)
            Text(item.type)
          }

          Spacer()

          Text(item.amout, format: .currency(code: "USD"))
        }
      }
      .onDelete(perform: removeItems)
    }
    .navigationTitle("iExpense")
    .toolbar {
      Button {
        showingAddExpense = true
      } label: {
        Image(systemName: "plus")
      }
    }
    .sheet(isPresented: $showingAddExpense) {
      AddView(expenses: expenses)
    }
  }

  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct Previews_iExpenseView_Previews: PreviewProvider {
  static var previews: some View {
    iExpenseView()
  }
}
