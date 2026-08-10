import SwiftUI

struct NoteDetailView: View {
    let note: Note

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(note.title)
                    .font(.system(size: 24, weight: .bold))
                Text(note.url.lastPathComponent)
                    .font(.callout).foregroundStyle(.secondary)
                Divider()
                Text(note.content)
                    .font(.body).lineSpacing(3)
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(24)
        }
        .navigationTitle(note.title)
    }
}
