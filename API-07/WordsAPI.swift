
import SwiftUI

struct WordsAPI: View {
    
    @StateObject var creaturesVM = WordsAPIModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(creaturesVM.creaturesArray, id: \.self, rowContent: { creature in
                
                HStack(alignment: .center) {
                    Text(creature.id)
                        .font(.title2)
//                    Divider()
                        .padding(.horizontal, 25)
                    
                    Text(creature.entrytype)
                        .font(.title2)
//                    Divider()
                        .padding(.horizontal, 25)
                    
                    Text(creature.headword)
                        .font(.title2)
                        .padding(.horizontal, 25)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Words")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}


struct WordsAPI_Previews: PreviewProvider {
    
    static var previews: some View {
        WordsAPI()
        
    }
}
