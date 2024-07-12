//
//  DataReferenceBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct DataReferenceBoxDetailView: View {
    @Binding var dataReferenceBox: QTBox?
    
    var body: some View {
        
        if let value = $dataReferenceBox.wrappedValue as? QTDataReferenceBox {

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
        @State var dataReferenceBox = try CreateSampleDataReferenceBox()
        return DataReferenceBoxDetailView(dataReferenceBox: $dataReferenceBox)
    } catch {
        return Text("Error")
    }
}
