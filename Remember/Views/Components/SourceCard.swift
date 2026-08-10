import SwiftUI

struct SourceCard: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            FileHeader(name: note.title)
            Text(note.url.lastPathComponent)
                .font(.callout).foregroundStyle(.secondary).lineLimit(2)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardBackground()
        .contentShape(Rectangle())
    }
}
