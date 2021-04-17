//
//  ViewSpecifying.swift
//  SizeThatFitsLayout
//
//  Created by Andrey Oparin on 17.04.2021.
//

import UIKit

protocol ViewSpecifying: UIViewController {
    
    associatedtype View
    
    var rootView: View { get }
}

extension ViewSpecifying {
    
    var rootView: View { view as! View }
}
