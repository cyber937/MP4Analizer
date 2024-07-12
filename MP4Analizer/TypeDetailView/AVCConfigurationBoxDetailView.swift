//
//  AVCConfigurationBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/12/24.
//

import SwiftUI
import MP4Parser

struct AVCConfigurationBoxDetailView: View {
    @Binding var avcConfigurationBox: QTBox?
    
    var body: some View {
        
        if let value = $avcConfigurationBox.wrappedValue as? QTAVCConfigurationBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Configuration Version:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.configurationVersion!)")
                            }
                            GridRow{
                                Text("AVC Profile Indication:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.avcProfileIndication!)")
                            }
                            GridRow{
                                Text("Profile Compatibility:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.profileCompatibility!)")
                            }
                            GridRow{
                                Text("AVC Level Indication:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.avcLevelIndication!)")
                            }
                            GridRow{
                                Text("Length Size Minus One:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.lengthSizeMinusOne!)")
                            }
                            GridRow{
                                Text("Number Of SPS:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.numOfSequenceParameterSets!)")
                            }
                            GridRow{
                                Text("SPS Length:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.sequenceParameterSetLength)")
                            }
                            GridRow{
                                Text("SPS Range:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.sequenceParameterSetNALUnitRange)")
                            }
                            GridRow{
                                Text("Number Of PPS:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.numOfPictureParameterSets!)")
                            }
                            GridRow{
                                Text("PPS Length:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.pictureParameterSetLength)")
                            }
                            GridRow{
                                Text("PPS Range:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.avcConfig!.pictureParameterSetNALUnitRange)")
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
        @State var avcConfigurationBox = try CreateSampleAVCConfigurationBox()
        return AVCConfigurationBoxDetailView(avcConfigurationBox: $avcConfigurationBox)
    } catch {
        return Text("Error")
    }
}
