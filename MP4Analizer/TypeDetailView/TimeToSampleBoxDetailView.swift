//
//  TimeToSampleBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct TimeToSampleBoxDetailView: View {
    
    @Binding var timeToSampleBox: QTBox?
    
    var body: some View {
        
        if let value = $timeToSampleBox.wrappedValue as? QTTimeToSampleBox {

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
                                Text("Sample-Delta:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.sampleDelta)")
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
        @State var timeToSampleBox = try CreateTimeToSampleBox()
        return TimeToSampleBoxDetailView(timeToSampleBox: $timeToSampleBox)
    } catch {
        return Text("Error")
    }
}
