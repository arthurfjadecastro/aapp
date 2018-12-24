//  Result.swift
//  EquipeRocket
//
//  Created by Gustavo Amaral on 23/10/18.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation

/// Used as parameter on closure that returns either a value or an error.
///
/// This enumeration exists to avoid the use of optional types when
/// performing an operation that returns either the correct value
/// or the error when there's one, but not both.
///
/// The type T the the type of returned value when it's all ok.
enum Result<T> {
    /// Used the the operation was successfully completed.
    case success(T)
    /// Used the an error occured.
    case error(Error)
}
