//
//  IRSingleButtonGroup.swift
//  IRSingleButtonGroup-swift
//
//  Created by Phil on 2020/9/25.
//  Copyright © 2020 Phil. All rights reserved.
//

import Foundation
import UIKit

public protocol IRSingleButtonGroupDelegate: NSObjectProtocol {
    func didSelectedButton(button: UIButton)
    func didDeselectedButton(button: UIButton)
}

public class IRSingleButtonGroup: NSObject {
    public var buttons: [UIButton] = []
    public var canSelectWhenSelected: Bool = false // default = NO
    public var canMultiSelected: Bool = false // default = NO
    public var delegate: IRSingleButtonGroupDelegate?
    
    public func selected(selectedButton: UIButton) {
        selected(selectedButton: selectedButton, delegatable: true)
    }
    
    public func deselected(selectedButton: UIButton) {
        selectedButton.isUserInteractionEnabled = true
        selectedButton.isSelected = false
        self.delegate?.didDeselectedButton(button: selectedButton)
    }
    
    public func setInitSelected(selectedButton: UIButton) {
        selected(selectedButton: selectedButton, delegatable: false)
    }
    
    public override init() {
        super.init()
        
        self.canSelectWhenSelected = false
    }
    
    func selected(selectedButton: UIButton, delegatable: Bool) {
        if !self.buttons.contains(selectedButton) {
            return
        }
        
        if !self.canSelectWhenSelected && !selectedButton.isSelected {
            selectedButton.isUserInteractionEnabled = false
        }
        if delegatable {
            self.delegate?.didSelectedButton(button: selectedButton)
        }
        selectedButton.isSelected = true
        for button in self.buttons {
            if button == selectedButton {
                continue
            }
            if self.canMultiSelected {
                break
            }
            
            if !self.canSelectWhenSelected {
                button.isUserInteractionEnabled = true
            }
            if delegatable {
                self.delegate?.didDeselectedButton(button: button)
            }
            button.isSelected = false
        }
    }
}

