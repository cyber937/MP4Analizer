//
//  SoundMediaHeaderBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct SoundMediaHeaderBoxDetailView: View {
    @Binding var soundMediaHeaderBox: QTBox?
    
    var body: some View {
        
        if let value = $soundMediaHeaderBox.wrappedValue as? QTSoundMediaHeaderBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Balance:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.balance!)")
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
        @State var soundMediaHeaderBox = try CreateSampleSoundMediaHeaderBox()
        return SoundMediaHeaderBoxDetailView(soundMediaHeaderBox: $soundMediaHeaderBox)
    } catch {
        return Text("Error")
    }
}
