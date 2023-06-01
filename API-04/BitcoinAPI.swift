
import SwiftUI

struct BitcoinAPI: View {
    
    @StateObject var creaturesVM = BitcoinAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center, spacing: 15) {
                    Text(creature.id)
                        .font(.title2)
                        .padding(.all)
                    Text(creature.rank)
                        .font(.title2)
                    Text(creature.symbol)
                        .font(.title2)
                    Text(creature.priceUsd)
                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Bitcoins")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct BitcoinAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        BitcoinAPI()
        
    }
}
