
import SwiftUI

struct MetadataAPI: View {
    
    @StateObject var creaturesVM = MetadataAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self) { creature in
                
                HStack(alignment: .center) {

                    Text(creature.stations[0].device_id)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Metadata")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct MetadataAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        MetadataAPI()
        
    }
}
