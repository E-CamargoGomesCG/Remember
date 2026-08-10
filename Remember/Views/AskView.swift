import SwiftUI

struct AskView: View {
    @Bindable var viewModel: NotesImportViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
                    TextField("Pergunte às suas notas…", text: $viewModel.question)
                        .textFieldStyle(.plain)
                        .onSubmit { Task { await viewModel.askQuestion() } }
                }
                .font(.body)
                .padding(.horizontal, 12).padding(.vertical, 12)
                .background(.background, in: RoundedRectangle(cornerRadius: 12))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(.quaternary, lineWidth: 1))

                if viewModel.isLoading {
                    HStack(spacing: 8) {
                        ProgressView()
                        Text("Pensando…").foregroundStyle(.secondary)
                    }
                }

                let resposta = viewModel.answer.trimmingCharacters(in: .whitespacesAndNewlines)
                if !resposta.isEmpty {
                    Text(resposta)
                        .font(.body).lineSpacing(3)
                        .fixedSize(horizontal: false, vertical: true)
                        .textSelection(.enabled)

                    Text("gerado on-device")
                        .font(.caption).foregroundStyle(.secondary)

                    if !viewModel.notes.isEmpty {
                        Text("FONTES")
                            .font(.caption).fontWeight(.semibold)
                            .foregroundStyle(.secondary).tracking(1.2)

                        LazyVGrid(
                            columns: [GridItem(.flexible(), spacing: 12),
                                      GridItem(.flexible(), spacing: 12)],
                            spacing: 12
                        ) {
                            ForEach(viewModel.fontes) { note in
                                NavigationLink(value: note) {
                                    SourceCard(note: note)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }

                Spacer(minLength: 0)
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .navigationTitle("Perguntar")
    }
}
