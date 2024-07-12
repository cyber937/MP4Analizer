//
//  FileTypeBoxDetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct FileTypeBoxDetailView: View {
    
    @Binding var fileTypeBox: QTBox?
    
    var body: some View {
        
        if let value = $fileTypeBox.wrappedValue as? QTFileTypeBox {

            VStack {
                GroupBox {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Major Brand:").bold().gridColumnAlignment(.trailing)
                                Text(value.majorBrand!)
                            }
                            GridRow{
                                Text("Minor Version:").bold()
                                Text("\(value.minorVersion!)")
                            }
                            GridRow{
                                Text("Compatible Brands:").bold()
                                ForEach(value.compatibleBrands, id: \.self) {
                                    Text($0)
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
        @State var fileTypeBox = try CreateSampleFileTypeBox()
        return FileTypeBoxDetailView(fileTypeBox: $fileTypeBox)
    } catch {
        return Text("Error")
    }
}
