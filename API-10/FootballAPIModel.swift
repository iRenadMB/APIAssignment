
import Foundation
import SwiftUI

class FootballAPIModel : ObservableObject {
    private struct Returned: Codable {
        let competitions: [Result]
    }
    
    struct Result: Codable, Hashable {
        let area: [DataOfArea]
    }
    
    struct DataOfArea: Codable, Hashable {
        let name: String
        let code: String
    }
    
    @Published var urlString = "http://api.football-data.org/v4/competitions/"
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
            
            self.creaturesArray = returned.competitions

            
        } catch {
            print("Error\(urlString)")
        }
    }
}

