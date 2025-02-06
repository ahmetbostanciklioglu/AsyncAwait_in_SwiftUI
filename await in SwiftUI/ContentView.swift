import SwiftUI

struct ContentView: View {
    
    @State private var data = "Veri bekleniyor...."
    
    var body: some View {
        VStack {
            Text(data)
                .font(.title)
                .padding()
            
            Button("Veriyi Yükle") {
                Task {
                    let result = await fetchData()
                    await MainActor.run {
                        data = result
                    }
                 
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
    
    func fetchData() async -> String {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        
        return "✅ Veri Yüklendi!"
    }
}

#Preview {
    ContentView()
}
