//
//  CompositionOffsetDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct CompositionOffsetDetailView: View {
    
    @Binding var compositionOffsetBox: QTBox?
    
    var body: some View {
        
        if let value = $compositionOffsetBox.wrappedValue as? QTCompositionOffsetBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
                            }
                            GridRow{
                                Text("Sample Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleCount)")
                            }
                            GridRow{
                                Text("Sample Offset:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleOffset)")
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

//#Preview {
//    do {
//        @State var chunkOffsetBox = try CreateChunkOffsetBox()
//        return ChunkOffsetBoxDetailView(chunkOffsetBox: $chunkOffsetBox)
//    } catch {
//        return Text("Error")
//    }
//}
