//
//  SampleModel.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/11/24.
//

import Foundation
import MP4Parser

func CreateSampleQTBoxURL() throws -> Data {
    let path = Bundle.main.path(forResource: "file_example_MP4_480_1_5MG", ofType: "mp4")
    let url = URL(fileURLWithPath: path!)
    let data = try Data(contentsOf: url, options: .mappedIfSafe)
    return data
}

func CreateSampleFileTypeBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let box = try data.parseForBox()
    let fileTypeBox = QTFileTypeBox(data: data, range: box.range, type: box.type)
    return fileTypeBox
}

func CreateSampleMovieHeaderBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 40)
    let movieHeaderBox = QTMovieHeaderBox(fullBox: fullBox)
    return movieHeaderBox
}

func CreateSampleTrackHeaderBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 198)
    let trackHeaderBox = QTTrackHeaderBox(fullBox: fullBox)
    return trackHeaderBox
}

func CreateSampleEditListBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 298)
    let editListBox = QTEditListBox(fullBox: fullBox)
    return editListBox
}

func CreateSampleMediaHeaderBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 334)
    let mediaHeaderBox = QTMediaHeaderBox(fullBox: fullBox)
    return mediaHeaderBox
}

func CreateSampleHandlerBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 366)
    let handlerBox = QTHandlerBox(fullBox: fullBox)
    return handlerBox
}

func CreateSampleVideoMediaHeaderBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 428)
    let videoMediaHeaderBox = QTVideoMediaHeaderBox(fullBox: fullBox)
    return videoMediaHeaderBox
}

func CreateSampleSoundMediaHeaderBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 5745)
    let soundMediaHeaderBox = QTSoundMediaHeaderBox(fullBox: fullBox)
    return soundMediaHeaderBox
}

func CreateSampleDataReferenceBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 456)
    let dataReferenceBox = QTDataReferenceBox(fullBox: fullBox)
    return dataReferenceBox
}

func CreateSampleDataEntryUrlBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 472)
    let dataEntryUrlBox = QTDataEntryUrlBox(fullBox: fullBox)
    return dataEntryUrlBox
}

func CreateSampleSampleDescriptionBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 492)
    let sampleDescriptionBox = QTSampleDescriptionBox(fullBox: fullBox)
    return sampleDescriptionBox
}

func CreateSampleAVCSampleEntry() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let box = try data.parseForBox(offset: 508)
    let avcSampleEntry = QTAVCSampleEntry(box: box)
    return avcSampleEntry
}

func CreateSampleAVCConfigurationBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let box = try data.parseForBox(offset: 594)
    let avcConfigurationBox = QTAVCConfigurationBox(data: data, range: box.range, type: box.type)
    return avcConfigurationBox
}

func CreateTimeToSampleBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 658)
    let timeToSampleBox = QTTimeToSampleBox(fullBox: fullBox)
    return timeToSampleBox
}

func CreateSyncSampleBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 682)
    let syncSampleBox = QTSyncSampleBox(fullBox: fullBox)
    return syncSampleBox
}

func CreateSampleToChunkBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 682)
    let sampleToChunkBox = QTSampleToChunkBox(fullBox: fullBox)
    return sampleToChunkBox
}

func CreateSampleSizeBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 682)
    let sampleSizeBox = QTSampleSizeBox(fullBox: fullBox)
    return sampleSizeBox
}

func CreateChunkOffsetBox() throws -> QTBox? {
    let data = try CreateSampleQTBoxURL()
    let fullBox = try data.parseForFullBox(offset: 682)
    let chunkOffsetBox = QTChunkOffsetBox(fullBox: fullBox)
    return chunkOffsetBox
}


