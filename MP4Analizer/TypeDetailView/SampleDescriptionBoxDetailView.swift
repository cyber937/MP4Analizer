//
//  SampleDescriptionBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct SampleDescriptionBoxDetailView: View {
    @Binding var sampleDescriptionBox: QTBox?
    
    var body: some View {
        
        if let value = $sampleDescriptionBox.wrappedValue as? QTSampleDescriptionBox {

            VStack {
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
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
        @State var sampleDescriptionBox = try CreateSampleSampleDescriptionBox()
        return SampleDescriptionBoxDetailView(sampleDescriptionBox: $sampleDescriptionBox)
    } catch {
        return Text("Error")
    }
}
