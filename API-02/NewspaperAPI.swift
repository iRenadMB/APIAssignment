
import SwiftUI

struct NewspaperAPI: View {
    
    @StateObject var creaturesVM = NewspaperAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack {
                    Text(creature.lccn)
                        .font(.title2)
                    Divider()
                    Text(creature.state)
                        .font(.title2)
                    Divider()
                    Text(creature.title)
                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Newspaper")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct NewspaperAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        NewspaperAPI()
        
    }
}
