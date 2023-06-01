
import Foundation
import SwiftUI

class BitcoinAPIModel : ObservableObject {
    
    private struct Returned: Codable {
        var data: [Bitcoin]
    }
    
    struct Bitcoin: Codable, Hashable {
        let id: String
        let rank: String
        let symbol: String
        let priceUsd: String
    }
    
    @Published var urlString = "https://api.coincap.io/v2/assets"
    @Published var creaturesArray: [Bitcoin] = []
    
    func getData() async {
        
        print("we are accessing the url\(urlString)")
        guard let url = URL(string: urlString) else {
            print("Error \(urlString)")
            return
        }
        do {
            let (date, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Returned.self, from: date) else {
                print("JSON error")
                return
            }
            self.creaturesArray = returned.data
        } catch {
            print("Error\(urlString)")
        }
    }
}
