//
//  StitchDocumentURLUtils.swift
//  Stitch
//
//  Created by Christian J Clampitt on 5/24/24.
//

import Foundation
import StitchSchemaKit

extension URL {
    func appendingStitchProjectDataPath(_ documentId: String) -> URL {
        self.appendingPathComponent(StitchDocument.getUniqueInternalDirectoryName(from: documentId),
                                    conformingTo: .stitchProjectData)
    }
    
    func appendingStitchSystemUnzippedPath(_ documentId: String) -> URL {
        self.appendingPathComponent(StitchDocument.getUniqueInternalDirectoryName(from: documentId),
                                    conformingTo: .stitchSystemUnzipped)
    }

    func appendingStitchMediaPath() -> URL {
        self.appendingPathComponent(StitchEncodableSubfolder.media.rawValue)
    }
    
    func appendingComponentsPath() -> URL {
        self.appendingPathComponent(StitchEncodableSubfolder.components.rawValue)
    }

    func appendingDataJsonPath() -> URL {
        self.appendingPathComponent(StitchClipboardContent.dataJsonName,
                                    conformingTo: .json)
    }

    /// Creates path for StitchDocument contents, specifiy the version number in the URL.
    func appendingVersionedSchemaPath(_ version: StitchSchemaVersion = StitchSchemaVersion.getNewestVersion()) -> URL {
        self.appendingPathComponent(StitchDocument.graphDataFileName)
            .appendingPathExtension(StitchDocument.createDataFileExtension(version: version))
    }
}
