
import SwiftUI

struct BoardAPI: View {
    
    @StateObject var creaturesVM = BoardAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center, spacing: 10) {
                    Text(creature.board)
                        .font(.title2)
                        .padding(.all)
                    Text(creature.title)
                        .font(.title2)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Boards")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct BoardAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        BoardAPI()
        
    }
}
