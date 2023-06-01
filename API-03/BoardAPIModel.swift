
import Foundation
import SwiftUI

class BoardAPIModel : ObservableObject {
    private struct Returned: Codable {
        let boards: [Boards]
    }
    
    struct Boards: Codable, Hashable {
        let board: String
        let title: String
//        var pages: Int
//        var threads: Int
//        var replies: Int
//        var images: Int
    }
    
    @Published var urlString = "https://a.4cdn.org/boards.json"
    @Published var creaturesArray: [Boards] = []
    
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
            self.creaturesArray = returned.boards
        } catch {
            print("Error\(urlString)")
        }
    }
}
