//
//  ExampleSelectModel.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import Foundation

enum ExampleSelectModel: CaseIterable {
    case frame
    case flexLayout
    case pinLayout
    
    var title: String {
        switch self {
        case .frame:
            return "Frame"
        case .flexLayout:
            return "FlexLayout"
        case .pinLayout:
            return "PinLayout"
        }
    }
}
