//
//  ChunkOffsetBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct ChunkOffsetBoxDetailView: View {
    
    @Binding var chunkOffsetBox: QTBox?
    
    var body: some View {
        
        if let value = $chunkOffsetBox.wrappedValue as? QTChunkOffsetBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
                            }
                            GridRow{
                                Text("Chunk Offset:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.chunkOffset)")
                            }
                        }
                        Spacer()
                    }.padding()
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    do {
        @State var chunkOffsetBox = try CreateChunkOffsetBox()
        return ChunkOffsetBoxDetailView(chunkOffsetBox: $chunkOffsetBox)
    } catch {
        return Text("Error")
    }
}
