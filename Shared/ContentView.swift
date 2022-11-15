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
    //MARK: - 全局环境变量 项目创建时，自动生成
    @Environment(\.managedObjectContext) private var viewContext

    //MARK: - 读数据 项目创建时，自动生成
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //MARK: - 左侧菜单
    private var items_menu: [String] = ["Players", "New Game", "Share", "Voice Training"]
    
    //MARK: - 全局环境变量 状态控制，声明
    @EnvironmentObject var mainStates: MainStateControl
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items_menu.indices, id: \.self) { index in
                    NavigationLink {
                        switch index {
                        case 0 :
                            Text("Item at \(items_menu[index])")
                            
                        case 1 :
                            // 主页面
                            MainTracker()
                            
                        default :
                            // 主页面
                            MainTracker()
                        }
                        
                    } label: {
                        Text(items_menu[index])
                    }
                }
            }
            .navigationTitle(Text("Game Tracker"))
            
            
            VStack {
                MainTracker()
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
        ContentView()
            .environmentObject(MainStateControl())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.landscapeLeft)
    }
}
