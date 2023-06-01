
import SwiftUI

struct CountryAPI: View {
    
    @StateObject var creaturesVM = CountryAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center, spacing: 15) {
                    Text(creature.enumeration_type)
                        .font(.title2)
                        .padding(.all)
//                    Text(creature.addresses.country_code)
//                        .font(.title2)
              
                }
            })
            .listStyle(.plain)
            .navigationTitle("Countries")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct CountryAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        CountryAPI()
        
    }
}
