//
//  AVCSampleEntryDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct AVCSampleEntryDetailView: View {
    @Binding var avcSampleEntry: QTBox?
    
    var body: some View {
        
        if let value = $avcSampleEntry.wrappedValue as? QTAVCSampleEntry {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Width:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.width!)")
                            }
                            GridRow{
                                Text("Height:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.height!)")
                            }
                            GridRow{
                                Text("Horizonal Resolution:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.horizresolution!)")
                            }
                            GridRow{
                                Text("Vertical Resolution:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.horizresolution!)")
                            }
                            GridRow{
                                Text("Frame Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.frameCount!)")
                            }
                            GridRow{
                                Text("Compressor Name:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.compressorname!)")
                            }
                            GridRow{
                                Text("Depth:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.depth!)")
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
        @State var avcSampleEntry = try CreateSampleAVCSampleEntry()
        return AVCSampleEntryDetailView(avcSampleEntry: $avcSampleEntry)
    } catch {
        return Text("Error")
    }
}
