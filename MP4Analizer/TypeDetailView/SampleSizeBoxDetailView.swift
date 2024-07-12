//
//  SampleSizeBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct SampleSizeBoxDetailView: View {
    @Binding var sampleSizeBox: QTBox?
    
    var body: some View {
        
        if let value = $sampleSizeBox.wrappedValue as? QTSampleSizeBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Sample Size:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleSize!)")
                            }
                            GridRow{
                                Text("Sample Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleCount!)")
                            }
                            GridRow{
                                Text("Entry Size:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entrySize)")
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
        @State var sampleSizeBox = try CreateSampleSizeBox()
        return SampleSizeBoxDetailView(sampleSizeBox: $sampleSizeBox)
    } catch {
        return Text("Error")
    }
}
