//
//  ContentView.swift
//  Shared
//
//  Created by 范志勇 on 2022/11/11.
//

import SwiftUI
import CoreData

///左侧菜单及调用
struct ContentView: View {
    func calColumnWidths() -> [CGFloat] {
        let adjust_width = CGFloat(5)
        
        let width_screen = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        let width = (width_screen - 16) / CGFloat(headerWords.count) // 间距1
        
        let adjust_width2 = adjust_width * 12 / 3
        
        let width_headers: [CGFloat] = [width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width + adjust_width2, width + adjust_width2, width + adjust_width2, width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width, width - adjust_width]
        
        return width_headers
        
    }
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private var items_menu: [String] = ["Players", "New Game", "Share", "Voice Training"]
    
    var liveDatas = LiveData.createData()
    
    //MARK: - 状态及绑定
    @State private var plus_minus: Int = 1
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items_menu.indices, id: \.self) { index in
                    NavigationLink {
                        switch index {
                        case 0 :
                            Text("Item at \(items_menu[index])")
                            
                        case 1 :
                            MainTracker(plus_minus: $plus_minus)
                            
                        default :
                            PlayerLiveDataTable(plus_minus: plus_minus)
                        }
                        
                    } label: {
                        Text(items_menu[index])
                    }
                }
//                .onDelete(perform: deleteItems)
            }
            .navigationTitle(Text("Game Tracker"))
            
            
            VStack {
                MainTracker(plus_minus: $plus_minus)
            }
        }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.landscapeLeft)
    }
}
