//
//  CustomView.swift
//  NibBasedDemo
//
//  Created by Maciej Gad on 23/01/2019.
//  Copyright © 2019 MaciejGad. All rights reserved.
//

import Foundation
import NibBased
import UIKit

class CustomView:UIView, LoadFromNib {
    @IBOutlet weak var textLabel: UILabel!
}

@objc protocol CustomViewContainerInput where Self: UIView {
    var customView:CustomView? { get }
}

@IBDesignable
class CustomViewContainer:NibViewContainer<CustomView>, CustomViewContainerInput {
    var customView: CustomView? {
        return view
    }
}
