//
//  MediaHeaderBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct MediaHeaderBoxDetailView: View {
    @Binding var mediaheaderBox: QTBox?
    
    var body: some View {
        
        if let value = $mediaheaderBox.wrappedValue as? QTMediaHeaderBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Creation Time:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.creationTime!)")
                            }
                            GridRow{
                                Text("Modification Time:").bold()
                                Text("\(value.modificationTime!)")
                            }
                            GridRow{
                                Text("Time Scale:").bold()
                                Text("\(value.timeScale!)")
                            }
                            GridRow{
                                Text("Duration:").bold()
                                Text("\(value.duration!)")
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
        @State var mediaheaderBox = try CreateSampleMediaHeaderBox()
        return MediaHeaderBoxDetailView(mediaheaderBox: $mediaheaderBox)
    } catch {
        return Text("Error")
    }
}

