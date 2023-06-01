
import Foundation
import SwiftUI

class NewspaperAPIModel : ObservableObject {
    
    private struct Returned: Codable {
        let newspapers: [Result]
    }
    
    struct Result: Codable, Hashable {
        let lccn: String
        let state: String
        let title: String
    }
    
    @Published var urlString = "https://chroniclingamerica.loc.gov/newspapers.json"
    @Published var creaturesArray: [Result] = []
    
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
            self.creaturesArray = returned.newspapers
            
        } catch {
            print("Error\(urlString)")
        }
    }
}
