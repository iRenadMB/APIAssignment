
import SwiftUI

struct FootballAPI: View {
    
    @StateObject var creaturesVM = FootballAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center) {

                    Text(creature.area[0].name)
                        .font(.title2)
//                    Text(creature.area[1].code)
//                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Football")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct FootballAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        FootballAPI()
        
    }
}
