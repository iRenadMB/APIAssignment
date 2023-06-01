
import SwiftUI

struct StatementAPI: View {
    
    @StateObject var creaturesVM = StatementAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center, spacing: 20) {
//                    Text(creature.id)
//                        .font(.title2)
                    Text(creature.advice)
                        .font(.title2)
                    
                    Text(creature.date)
                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .multilineTextAlignment(.leading)
            .navigationTitle("Statements")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct StatementAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        StatementAPI()
        
    }
}
