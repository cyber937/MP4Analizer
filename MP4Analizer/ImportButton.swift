//
//  ImportButton.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/10/24.
//

import SwiftUI

struct ImportButton: View {

    @State private var importing = false
    //@Binding var url: URL
    
    var body: some View {
        
        Button("Import") {
            importing = true
        }
//        .fileImporter(
//            isPresented: $importing,
//            allowedContentTypes: [.mpeg4Movie, .movie]
//        ) { result in
//            switch result {
//            case .success(let file):
//                
//                url = URL(fileURLWithPath: file.path)
//                
////                do {
////                    let testData = try Data(contentsOf: url, options: .mappedIfSafe)
////                    
////                    let _ = Task {
////                        
////                        let boxData = try await testData.parseForMP4Data()
////                        
////                        guard let children = boxData.children else { throw TestError.test }
////                        
////                        //box = children
////                    }
////                    
////                } catch {
////                    print(error)
////                }
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
    }
}

//#Preview {
//    var testUrl: URL
//    ImportButton()
//}
