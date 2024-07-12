//
//  SidebarView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct SidebarView: View {
    
    @Binding var box: [QTBox]?
    @Binding var selectedBox: QTBox?
    
    var body: some View {
        
        if let box {
            List(box, id:\.self, children: \.children, selection: $selectedBox) { item in
                Text(item.typeReadable)
            }
            .listStyle(.sidebar)
        }
        
    }
}

#Preview {
    @State var box: [QTBox]? = nil
    @State var selectedBox: QTBox? = nil
    
    return SidebarView(box: $box, selectedBox: $selectedBox)
}
