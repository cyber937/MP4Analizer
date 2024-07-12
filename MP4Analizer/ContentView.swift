//
//  ContentView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/8/24.
//

import SwiftUI
import MP4Parser

enum TestError: Error {
    case NoChildBoxes
}

struct ContentView: View {
    
    @State private var importStart = true
    @State private var box: [QTBox]? = nil
    @State private var selectedBox: QTBox? = nil
    
    var body: some View {
        NavigationView {
            
            SidebarView(box: $box, selectedBox: $selectedBox)
            DetailView(selectedBox: $selectedBox)
            
        }.fileImporter(
            isPresented: $importStart,
            allowedContentTypes: [.mpeg4Movie, .movie]
        ) { result in
            switch result {
            case .success(let file):
                let _ = Task {
                    do {
                        try await openBox(path: file.path)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func openBox(path: String) async throws {
        
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        
        let boxData = try await data.parseForMP4Data()
        guard let children = boxData.children else { throw TestError.NoChildBoxes }
        box = children
    }
}

#Preview {
    ContentView()
}
