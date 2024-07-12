//
//  DataEntryUrlBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct DataEntryUrlBoxDetailView: View {
    
    @Binding var dataEntryUrlBox: QTBox?
    
    var body: some View {
        
        if let value = $dataEntryUrlBox.wrappedValue as? QTDataEntryUrlBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Location Size:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.locationSize!)")
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
        @State var dataEntryUrlBox = try CreateSampleDataEntryUrlBox()
        return DataEntryUrlBoxDetailView(dataEntryUrlBox: $dataEntryUrlBox)
    } catch {
        return Text("Error")
    }
}
