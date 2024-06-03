//
//  AddView.swift
//  iExpense
//
//  Created by Charlie Chiou on 2024/5/26.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var currency = "USD"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    let availableCurrencies: [String] = {
        let locales = Locale.availableIdentifiers.map { Locale(identifier: $0) }
        return locales.compactMap { $0.currency?.identifier }
    }()
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Currency", selection: $currency) {
                    ForEach(availableCurrencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, currency: currency ,amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    AddView(expenses: Expenses())
}
