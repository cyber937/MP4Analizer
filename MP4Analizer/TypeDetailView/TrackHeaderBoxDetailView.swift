//
//  TrackHeaderBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct TrackHeaderBoxDetailView: View {
    @Binding var trackheaderBox: QTBox?
    
    var body: some View {
        
        if let value = $trackheaderBox.wrappedValue as? QTTrackHeaderBox {

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
                                Text("Track ID:").bold()
                                Text("\(value.trackID!)")
                            }
                            GridRow{
                                Text("Duration:").bold()
                                Text("\(value.duration!)")
                            }
                            GridRow{
                                Text("Volume:").bold()
                                Text("\(value.volume!)")
                            }
                            GridRow{
                                Text("Matrix:").bold()
                                VStack {
                                    HStack {
                                        GridRow{
                                            Text("\(value.matrix[0])")
                                            Text("\(value.matrix[1])")
                                            Text("\(value.matrix[2])")
                                        }
                                        Spacer()
                                    }
                                    HStack {
                                        GridRow{
                                            Text("\(value.matrix[3])")
                                            Text("\(value.matrix[4])")
                                            Text("\(value.matrix[5])")
                                        }
                                        Spacer()
                                    }
                                    HStack {
                                        GridRow{
                                            Text("\(value.matrix[6])")
                                            Text("\(value.matrix[7])")
                                            Text("\(value.matrix[8])")
                                        }
                                        Spacer()
                                    }
                                }

                            }
                            GridRow{
                                Text("Width:").bold()
                                Text("\(value.width!)")
                            }
                            GridRow{
                                Text("Height:").bold()
                                Text("\(value.height!)")
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
        @State var trackheaderBox = try CreateSampleTrackHeaderBox()
        return TrackHeaderBoxDetailView(trackheaderBox: $trackheaderBox)
    } catch {
        return Text("Error")
    }
}
