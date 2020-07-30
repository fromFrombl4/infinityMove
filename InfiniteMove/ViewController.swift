//
//  ViewController.swift
//  InfiniteMove
//
//  Created by Roman Dod on 7/28/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

enum Sides{
    
    case left
    case right
    case up
    case down
}

class ViewController: UIViewController {
    
    var myView: UIView? = UIView()
    let width = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView = createView()
        self.view.addSubview(myView!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        moveRight()
    }
    
    func moveRight(){
        UIView.animate(withDuration: 2, animations: {
            
            self.myView?.layer.position = CGPoint(x: Int(self.view.frame.size.width) - self.width, y: 100)
            
        }) { (_) in
            self.moveDown()
        }
    }
    
    func moveDown() {
        UIView.animate(withDuration: 2, animations: {self.myView?.layer.position = CGPoint(x: Int(self.view.frame.size.width) - self.width, y: Int(self.view.frame.size.height) - self.width)}) {
            (_) in
            
            self.moveLeft()
        }
    }
    
    func moveLeft(){
        UIView.animate(withDuration: 2, animations: {self.myView?.layer.position = CGPoint(x: 100, y: Int(self.view.frame.size.height) - self.width)}) {
                       (_) in
            self.moveTop()
                       
        }
    }
    
    func moveTop() {
        UIView.animate(withDuration: 2, animations: {self.myView?.layer.position = CGPoint(x: 100, y: 100) }) { (_) in
            self.moveRight()
        }
    }

func createView() -> UIView {
    
    let view = UIView()
    view.frame = CGRect(x: 100, y: 100, width: width, height: width)
    view.backgroundColor = self.randomColor()
    view.layer.cornerRadius = CGFloat(width / 2)
    
    return view
}

private func randomColor() -> UIColor{
    
    let color = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    
    return color
}

}

