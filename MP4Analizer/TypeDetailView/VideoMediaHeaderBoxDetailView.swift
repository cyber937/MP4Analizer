//
//  VideoMediaMeaderBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct VideoMediaHeaderBoxDetailView: View {
    @Binding var videoMediaHeaderBox: QTBox?
    
    var body: some View {
        
        if let value = $videoMediaHeaderBox.wrappedValue as? QTVideoMediaHeaderBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Graphics Mode:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.graphicsmode!)")
                            }
                            GridRow{
                                Text("OP Color:").bold()
                                ForEach(value.opcolor, id: \.self) {
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
        @State var videoMediaHeaderBox = try CreateSampleVideoMediaHeaderBox()
        return VideoMediaHeaderBoxDetailView(videoMediaHeaderBox: $videoMediaHeaderBox)
    } catch {
        return Text("Error")
    }
}
