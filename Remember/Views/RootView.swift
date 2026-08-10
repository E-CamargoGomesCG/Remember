import SwiftUI

struct RootView: View {
    @State private var viewModel = NotesImportViewModel()
    @State private var section: SidebarSection = .ask
    @State private var path: [Note] = []              

    var body: some View {
        if viewModel.notes.isEmpty {
            NotesImportView(viewModel: viewModel)
        } else {
            NavigationSplitView {
                SidebarView(section: $section,
                            footerText: "\(viewModel.notes.count) notas indexadas")
                    .navigationSplitViewColumnWidth(240)
            } detail: {
                NavigationStack(path: $path) {
                    content
                        .navigationDestination(for: Note.self) { note in
                            NoteDetailView(note: note)
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch section {
        case .ask:     AskView(viewModel: viewModel)
        case .myNotes: MyNotesView(notes: viewModel.notes)
        }
    }
}
