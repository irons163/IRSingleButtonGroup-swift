//
//  SingleButtonTableViewCell.swift
//  demo
//
//  Created by Phil on 2020/9/25.
//  Copyright © 2020 Phil. All rights reserved.
//

import UIKit
import IRSingleButtonGroup_swift

class SingleButtonTableViewCell: UITableViewCell, IRSingleButtonGroupDelegate {
    
    var canMultiSelected: Bool
    {
        set {
            singleButtonGroup.canMultiSelected = newValue
        }
        get {
            return singleButtonGroup.canMultiSelected
        }
    }
    var disableDeselection: Bool
    {
        didSet
        {
            singleButtonGroup.canSelectWhenSelected = disableDeselection
        }
    }
    func setDefaultIndex(defaultIndex: NSInteger) {
        self.singleButtonGroup.setInitSelected(selectedButton: singleButtonGroup.buttons[defaultIndex])
    }
    class func identifier() -> String {
        
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var singleButtonGroup: IRSingleButtonGroup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupEnableBandsButtons()
        
        self.singleButtonGroup = IRSingleButtonGroup.init()
        self.singleButtonGroup.buttons = [self.button1, self.button2, self.button3]
        self.singleButtonGroup.canSelectWhenSelected = true
        self.singleButtonGroup.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupEnableBandsButtons() {
        self.button1.tag = 1;
        self.button2.tag = 2;
        self.button3.tag = 3;
        self.setupBandButtonsDisabledState()
        self.resetEnableBandsButtonsStatus()
    }
    
    func setupDisabledStateInBandButton(bandButton: UIButton) {
        bandButton.setImage(self.translucentImageFromImage(image: bandButton.image(for: .normal)!, alpha: 1), for: [.normal, .disabled])
        bandButton.setImage(self.translucentImageFromImage(image: bandButton.image(for: .selected)!, alpha: 1), for: [.selected, .disabled])
    }
    
    func translucentImageFromImage() {
        
    }
    
    func setupBandButtonsDisabledState() {
        self.setupDisabledStateInBandButton(bandButton: self.button1)
        self.setupDisabledStateInBandButton(bandButton: self.button2)
        self.setupDisabledStateInBandButton(bandButton: self.button3)
    }
    
    func resetEnableBandsButtonsStatus() {
        self.button1.setTitle("button1", for: .normal)
        self.button2.setTitle("button2", for: .normal)
        self.button3.setTitle("button3", for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.resetEnableBandsButtonsStatus()
    }
    
    func translucentImageFromImage(image: UIImage, alpha: CGFloat) -> UIImage? {
        var rect = CGRect.zero
        rect.size = image.size
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
        image.draw(in: rect, blendMode: .screen, alpha: alpha)
        let translucentImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return translucentImage
    }
    
// MARK: - IBAction
    @IBAction func button1Click(_ sender: Any) {
        self.clickBandButton(sender: sender as! UIButton)
    }
    @IBAction func button2Click(_ sender: Any) {
        self.clickBandButton(sender: sender as! UIButton)
    }
    @IBAction func button3Click(_ sender: Any) {
        self.clickBandButton(sender: sender as! UIButton)
    }
    
    func clickBandButton(sender: UIButton) {
        if sender.isSelected {
            self.singleButtonGroup.deselected(selectedButton: sender)
        } else {
            self.singleButtonGroup.selected(selectedButton: sender)
        }
    }
    
// MARK: - SingleButtonGroupDelegate
    func didSelectedButton(button: UIButton) {
        NSLog("Button%ld", button.tag)
    }
    
    func didDeselectedButton(button: UIButton) {
        NSLog("Button%ld", button.tag)
    }
}
