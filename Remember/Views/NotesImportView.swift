import SwiftUI

struct NotesImportView: View {
    @Bindable var viewModel: NotesImportViewModel

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image(systemName: "folder")
                .font(.system(size: 44, weight: .light))
                .foregroundStyle(.secondary)
                .frame(width: 120, height: 120)
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(color: .black.opacity(0.06), radius: 12, y: 4)

            Text("Escolha sua pasta de anotações")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)

            Text("O remember lê seus arquivos .md localmente.\nNada sai do seu Mac.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button {
                viewModel.selecionarVault()
            } label: {
                Text("Selecionar pasta")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 12)
                    .background(Color(white: 0.10), in: RoundedRectangle(cornerRadius: 12))
            }
            .buttonStyle(.plain)
            .padding(.top, 8)

            Text("⌘O").font(.caption).foregroundStyle(.tertiary)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
