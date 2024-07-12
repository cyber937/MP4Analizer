//
//  SampleToChunkBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct SampleToChunkBoxDetailView: View {
    @Binding var sampleToChunkBox: QTBox?
    
    var body: some View {
        
        if let value = $sampleToChunkBox.wrappedValue as? QTSampleToChunkBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
                            }
                            GridRow{
                                Text("First Chunk:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.firstChunk)")
                            }
                            GridRow{
                                Text("Sample Per Chunk:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.samplePerChunk)")
                            }
                            GridRow{
                                Text("Sample Description Index:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleDescriptionIndex)")
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
        @State var sampleToChunkBox = try CreateSampleToChunkBox()
        return SampleToChunkBoxDetailView(sampleToChunkBox: $sampleToChunkBox)
    } catch {
        return Text("Error")
    }
}
