import SwiftUI

struct MyNotesView: View {
    let notes: [Note]

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Minhas Notas").font(.system(size: 22, weight: .bold))
                Spacer()
                Text("\(notes.count) notas").font(.caption).foregroundStyle(.secondary)
            }

            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(notes) { note in
                        NavigationLink(value: note) {
                            NoteCard(note: note)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Minhas Notas")
    }
}
