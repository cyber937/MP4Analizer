//
//  HandlerBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct HandlerBoxDetailView: View {
    @Binding var handlerBox: QTBox?
    
    var body: some View {
        
        if let value = $handlerBox.wrappedValue as? QTHandlerBox {

            VStack {
                
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Handler Type:").bold().gridColumnAlignment(.trailing)
                                Text("\(value.handlerType!)")
                            }
                            GridRow{
                                Text("Name:").bold()
                                Text("\(value.name!)")
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
        @State var handlerBox = try CreateSampleHandlerBox()
        return HandlerBoxDetailView(handlerBox: $handlerBox)
    } catch {
        return Text("Error")
    }
}
