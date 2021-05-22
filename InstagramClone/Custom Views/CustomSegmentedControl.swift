//
//  CustomSegmentedControl.swift
//  InstagramClone
//
//  Created by joel Alcantara on 20/5/21.
//

import UIKit
import Anchorage

protocol ActivityDelegate: AnyObject {
    func scrollTo(index: Int)
}

class CustomSegmentedControl: UIView {
    weak var delegate: ActivityDelegate?
    var buttons = [UIButton]()
    var selectedSegmentedIndex = 0
    var selector: UIView!
    let buttonTitles: [String] = ["Following","You"]
    let textColor: UIColor = .lightGray
    let selectorTextColor: UIColor = .black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateView()
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        for buttonTitle in buttonTitles {
            let button = UIButton.init(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        let y = frame.maxY - frame.minY - 4.0
        selector = UIView.init(frame: CGRect(x: 0, y: y, width: selectorWidth, height: 2.0))
        selector.backgroundColor = selectorTextColor
        
        addSubview(selector)
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
        
        addSubview(stackView)
        stackView.edgeAnchors == edgeAnchors
        
    }
    
    @objc func buttonTapped(button: UIButton) {
        guard let indexOfButton = buttons.firstIndex(of: button) else {return}
        guard indexOfButton != selectedSegmentedIndex else { return }
        selectedSegmentedIndex = indexOfButton
        updateSegmentedControlSegs(index: indexOfButton)
    }
    
    @objc func buttonTitle(button: UIButton) {
        for (index, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                selectedSegmentedIndex = index
                delegate?.scrollTo(index: selectedSegmentedIndex)
            }
        }
    }
    
    func updateSegmentedControlSegs(index: Int) {
        if selectedSegmentedIndex != index {
            selectedSegmentedIndex = index
        }
        buttons.forEach { btn in
            btn.setTitleColor(textColor, for: .normal)
        }
        
        let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(index)
        
        UIView.animate(withDuration: 0.5) {
            self.selector.frame.origin.x = selectorStartPosition
        }
        
        buttons[index].setTitleColor(selectorTextColor, for: .normal)
        delegate?.scrollTo(index: index)
    }

}
