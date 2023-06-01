
import Foundation
import SwiftUI

class WordsAPIModel : ObservableObject {
    private struct Returned: Codable {
        let words: [Result]
    }
    
    struct Result: Codable, Hashable {
        let id: String
        let entrytype: String
        let headword: String
    }
    
    @Published var urlString = "https://api.ctext.org/getdictionaryheadwords"
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
            
            self.creaturesArray = returned.words
        } catch {
            print("Error\(urlString)")
        }
    }
}
