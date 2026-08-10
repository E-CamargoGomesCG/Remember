import SwiftUI

struct NoteCard: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            FileHeader(name: note.title)
            Text(note.url.lastPathComponent)
                .font(.caption).foregroundStyle(.secondary).lineLimit(1)
            Spacer(minLength: 0)
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 96, alignment: .leading)
        .cardBackground()
        .contentShape(Rectangle())
    }
}
