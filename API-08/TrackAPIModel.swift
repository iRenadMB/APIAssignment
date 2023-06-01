
import Foundation
import SwiftUI

class TrackAPIModel : ObservableObject {
    private struct Returned: Codable {
        let tracks: [Result]
    }
    
    struct Result: Codable, Hashable {
        let uNm: String
//        let id: String
        let name: String
    }
    
    @Published var urlString = "https://openwhyd.org/hot/electro?format=json"
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
            
            self.creaturesArray = returned.tracks
            
        } catch {
            print("Error\(urlString)")
        }
    }
}
