//
//  AddNewListView.swift
//  RemindMe
//
//  Created by Daniel Nolasco on 10/12/24.
//

import SwiftUI

struct AddNewListView: View {
    @Environment(\.dismiss) private var dismiss: DismissAction

    @State private var name: String = ""
    @State private var selectedColor: Color = .red

    private var isFormValid: Bool { !name.isEmpty }

    let onSave: (String, UIColor) -> Void

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundColor(selectedColor)
                    .font(.system(size: 100))
                TextField("List Name", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(30)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            ColorPickerView(selectedColor: $selectedColor)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("New List")
                    .font(.headline)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    onSave(name, UIColor(selectedColor))
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddNewListView(
            onSave: { _, _ in
            }
        )
    }
}
