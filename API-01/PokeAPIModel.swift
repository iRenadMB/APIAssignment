
import Foundation
import SwiftUI

class PokeAPIModel : ObservableObject {
    private struct Returned: Codable {
        let count: Int
        let next: String
        let results: [Result]
    }
    
    struct Result: Codable, Hashable {
        let name: String
        let url: String
    }
    
    @Published var urlString = "https://pokeapi.co/api/v2/pokemon/"
    @Published var count = 0
    @Published var creaturesArray: [Result] = []
    
    func getData() async {
        
        print("we are accessing the url\(urlString)")
        guard let url = URL(string: urlString) else {
            print("Error \(urlString)")
            return
        }
        do {
            let (date, response) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Returned.self, from: date) else {
                print("JSON error")
                return
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    print("Can not get status code")
                    return
                }

                if statusCode < 200 || statusCode > 299 {
                    print("Status code: (statusCode), is not in 200s.")
                    return
                }

                guard let dataAsString = String(data: date, encoding: .utf8) else {
                    print("Can not convert data to string")
                    return
                }
            }
            self.count = returned.count
            self.urlString = returned.next
            self.creaturesArray = returned.results
        } catch {
            print("Error\(urlString)")
        }
    }
}
