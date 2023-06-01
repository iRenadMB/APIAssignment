
import Foundation
import SwiftUI

class StatementAPIModel : ObservableObject {
    
    private struct Returned: Codable {
        let total_results: String
        let query: String
        var slips: [Info]
    }
    
    struct Info: Codable, Hashable {
        let id: Int
        let advice: String
        let date: String
//        var idInfo: Int {
//            id
//        }
    }
    
    @Published var urlString = "https://api.adviceslip.com/advice/search/love"
    @Published var creaturesArray: [Info] = []
//    @Published var id = 0
    
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
            self.urlString = returned.total_results
            self.urlString = returned.query
            self.creaturesArray = returned.slips


        } catch {
            print("Error\(urlString)")
        }
    }
}
