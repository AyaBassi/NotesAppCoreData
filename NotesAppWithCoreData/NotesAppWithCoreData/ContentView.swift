//
//  ContentView.swift
//  NotesAppWithCoreData
//
//  Created by Payam Karbassi on 02/05/2023.
//

import SwiftUI
import CoreData
import Firebase
struct ContentView: View {
    @State var isShown = false
    var title : String? = "SomeTitle"
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default) private var items: FetchedResults<Item>

    var body: some View {
        NavigationStack {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                    } label: {
//                    }
//                }
//            }
            
            Button("Crash") {
              fatalError("Crash was triggered")
            }
            
            Button("SomeButton"){
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-\(title!)",
                  AnalyticsParameterItemName: title!,
                  AnalyticsParameterContentType: "cont",
                ])
            }
            
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Add") {
//                        isShown = true
//                    }
//                }
//            }
            .navigationTitle("Notes")
            .sheet(isPresented: $isShown) {
                CreateNote()
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
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
