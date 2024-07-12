//
//  EditListBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct EditListBoxDetailView: View {
    @Binding var editListBox: QTBox?
    
    var body: some View {
        
        if let value = $editListBox.wrappedValue as? QTEditListBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Entry Count:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.entryCount!)")
                            }
                            GridRow{
                                Text("Segment Duration:").bold()
                                ForEach(value.segmentDuration, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            GridRow{
                                Text("Media Time:").bold()
                                ForEach(value.mediaTime, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            GridRow{
                                Text("Media Rate Interger:").bold().gridColumnAlignment(.trailing)
                                ForEach(value.mediaRateInteger, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            GridRow{
                                Text("Media Rate Fraction:").bold().gridColumnAlignment(.trailing)
                                ForEach(value.mediaRateFraction, id: \.self) {
                                    Text("\($0)")
                                }
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
        @State var edityListBox = try CreateSampleEditListBox()
        return EditListBoxDetailView(editListBox: $edityListBox)
    } catch {
        return Text("Error")
    }
}
