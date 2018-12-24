//
//  File.swift
//  EquipeRocket
//
//  Created by Gustavo Amaral on 06/12/18.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation

/// This class is a representation of a file on bundle. You can use the
/// instance method buildURL() to find this file url on the bundle.
struct File: Codable {
    /// File's name without extension.
    let name: String
    /// File's extension without the dot.
    let `extension`: String
    
    /// Returns the file on the parameter bundle if there's one of `nil` otherwise.
    func buildURL(_ bundle: Bundle = .main) -> URL? {
        guard let path = self.buildPath(bundle) else {
            assertionFailure("Unable to find the file in the bundle")
            return nil
        }
        return URL(fileURLWithPath: path)
    }
    
    /// Returns the file's path on the parameter bundle of `nil` if there's no one.
    private func buildPath(_ bundle: Bundle = .main) -> String? {
        return bundle.path(forResource: self.name, ofType: self.extension)
    }
}

extension File {
    /// Creates a file's representation based on the parameter url.
    init(_ url: URL) {
        let withoutExtension = url.deletingPathExtension()
        self.name = withoutExtension.lastPathComponent
        self.extension = url.pathExtension
    }
}

/// Used when there's error when handling files.
enum FileError: Error {
    /// Used when the file isn't found on the bundle.
    case fileNotFound
}
