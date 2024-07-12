//
//  SyncSampleBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct SyncSampleBoxDetailView: View {
    
    @Binding var syncSampleBox: QTBox?
    
    var body: some View {
        
        if let value = $syncSampleBox.wrappedValue as? QTSyncSampleBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
                            }
                            GridRow{
                                Text("Sample Number:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleNumber)")
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
        @State var syncSampleBox = try CreateSyncSampleBox()
        return SyncSampleBoxDetailView(syncSampleBox: $syncSampleBox)
    } catch {
        return Text("Error")
    }
}
