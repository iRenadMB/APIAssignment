
import Foundation
import SwiftUI

class CountryAPIModel : ObservableObject {
    
    private struct Returned: Codable {
        var results: [Country]
    }
    
    struct Country: Codable, Hashable {
        let enumeration_type: String
        let addresses: [AddressInfo]
    }
    
    struct AddressInfo: Codable, Hashable {
        let country_code: String
        let country_name: String
        let postal_code: String
        var id: String {
            country_code
        }
    }
    
    @Published var urlString = "https://npiregistry.cms.hhs.gov/api/?version=2.1&city=baltimore"
    @Published var creaturesArray: [Country] = []
//    @Published var createanArray: [AddressInfo] = []
    
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
            self.creaturesArray = returned.results
//            self.createanArray = returned.addresses

        } catch {
            print("Error\(urlString)")
        }
    }
}
