import SwiftUI

struct NotesImportView: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("REMEMBER")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .tracking(1.2)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 8)

                SidebarItem(icon: "magnifyingglass", title: "Perguntar", isActive: true)
                SidebarItem(icon: "doc.text", title: "Minhas Notas", isActive: false)

                Spacer()

                HStack(spacing: 6) {
                    Circle()
                        .fill(.secondary)
                        .frame(width: 6, height: 6)
                    Text("Nenhuma pasta")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 8)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
            .frame(width: 240)
            .background(.regularMaterial)

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

                Text("O remem lê seus arquivos .md localmente.\nNada sai do seu Mac.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                Button(action: selecionarPasta) {
                    Text("Selecionar pasta")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 12)
                        .background(.black, in: RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
                .padding(.top, 8)

                Text("⌘O")
                    .font(.caption)
                    .foregroundStyle(.tertiary)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [Color(white: 0.98), Color(white: 0.96)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .frame(minWidth: 800, minHeight: 600)
    }

    private func selecionarPasta() {
    }
}

#Preview {
    NotesImportView()
}
