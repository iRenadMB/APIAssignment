
import SwiftUI

struct TrackAPI: View {
    
    @StateObject var creaturesVM = TrackAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center) {

                    Text(creature.uNm)
                        .font(.title2)
                    
//                    Text(creature.id)
//                        .font(.title2)
                    Text(creature.name)
                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Tracks")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct TrackAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        TrackAPI()
        
    }
}
