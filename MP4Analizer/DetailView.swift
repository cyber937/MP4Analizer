//
//  DetailView.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import SwiftUI
import MP4Parser

struct DetailView: View {
    
    @Binding var selectedBox: QTBox?
    
    var body: some View {
        
        if let value = $selectedBox.wrappedValue{
            VStack {
                GroupBox(label: Label("Basic Information", systemImage: "").labelStyle(.titleOnly)) {
                    HStack {
                        Grid(alignment: .leadingFirstTextBaseline, verticalSpacing: 10) {
                            GridRow{
                                Text("Name:").bold().gridColumnAlignment(.trailing)
                                Text(value.typeReadable)
                            }
                            GridRow{
                                Text("Range:").bold()
                                Text("\(value.range)")
                            }
                            GridRow{
                                Text("Size:").bold()
                                Text("\(value.size)")
                            }
                        }
                        Spacer()
                    }.padding()
                }
                
                typeDetailView
                
                Spacer()
            }.padding()
            
        } else {
            Text("No selection")
        }
    }
}

#Preview {
    do {
        @State var selectedBox: QTBox? = try CreateSampleFileTypeBox()
        return DetailView(selectedBox: $selectedBox)
    } catch {
        return Text("Error!")
    }
}

extension DetailView {
    
    private var typeDetailView: some View {

        VStack {
            switch selectedBox?.type {
            case .ftyp:
                FileTypeBoxDetailView(fileTypeBox: $selectedBox)
            case .mvhd:
                MovieHeaderBoxDetailView(movieheaderBox: $selectedBox)
            case .tkhd:
                TrackHeaderBoxDetailView(trackheaderBox: $selectedBox)
            case .elst:
                EditListBoxDetailView(editListBox: $selectedBox)
            case .mdhd:
                MediaHeaderBoxDetailView(mediaheaderBox: $selectedBox)
            case .hdlr:
                HandlerBoxDetailView(handlerBox: $selectedBox)
            case .vmhd:
                VideoMediaHeaderBoxDetailView(videoMediaHeaderBox: $selectedBox)
            case .smhd:
                SoundMediaHeaderBoxDetailView(soundMediaHeaderBox: $selectedBox)
            case .dref:
                DataReferenceBoxDetailView(dataReferenceBox: $selectedBox)
            case .url:
                DataEntryUrlBoxDetailView(dataEntryUrlBox: $selectedBox)
            case .stsd:
                SampleDescriptionBoxDetailView(sampleDescriptionBox: $selectedBox)
            case .avc1:
                AVCConfigurationBoxDetailView(avcConfigurationBox: $selectedBox)
            case .stts:
                TimeToSampleBoxDetailView(timeToSampleBox: $selectedBox)
            case .stss:
                SyncSampleBoxDetailView(syncSampleBox: $selectedBox)
            case .stsc:
                SampleToChunkBoxDetailView(sampleToChunkBox: $selectedBox)
            case .stsz:
                SampleSizeBoxDetailView(sampleSizeBox: $selectedBox)
            case .stco:
                ChunkOffsetBoxDetailView(chunkOffsetBox: $selectedBox)
            case .ctts:
                CompositionOffsetDetailView(compositionOffsetBox: $selectedBox)
            default:
                EmptyView()
            }
        }
    }
}
