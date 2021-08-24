//
//  ViewController.swift
//  PagieExample
//
//  Created by Elser_10 on 8/22/21.
//

import UIKit
import Pagie

class ViewController: PagieHome {

    fileprivate let myLoginId = "myLoginId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill pages information..
        let page1 = Page(title: "Discover great events happening in your city", subtitle: "Find events by category and browse list of trending events everyday.", imageName: "page1")
        let page2 = Page(title: "Maximize the value of every event you attend", subtitle: "Stay updated with event details, meet other attendees and get live announcements about important updates.", imageName: "page2")
        let page3 = Page(title: "Make the most out of every event", subtitle: "View updated agenda, sessions details and speakers from your phone.", imageName: "page3")
        let page4 = Page(title: "Network like a pro!", subtitle: "Join the event's community, like-minded people and shake hands through the app to keep track of your connections.", imageName: "page4")
        let pages: [Page] = [page1, page2, page3, page4]
        self.pages = pages
        
        
        // Customize pageControl
        pageControl.numberOfPages = self.pages.count + 1
//        pageControl.pageIndicatorTintColor = .gray
//        pageControl.currentPageIndicatorTintColor = .magenta
        
        // Customize getStartedButtonButton
        /*
        getStartedButton.backgroundColor = .cyan
        getStartedButton.setTitle("Sign up", for: .normal)
//        customizeButton(width: 100, height: 100)
//        getStartedButton.removeFromSuperview()
        */
        // If you want to customize your own LoginCell, you need to add this first.
//        collectionView.register(MyLoginCell.self, forCellWithReuseIdentifier: myLoginId)
    }
    
    // Handle getStartedButton method
    /*
    override func handleGetStartedButton() {
        print("Hello world!")
    }
    */
    
    // Customize getStartedButton bottom anchor, width and height
    /*
    override func customizeButton(width w: CGFloat, height h: CGFloat) {
        getStartedBottomAnchor = getStartedButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 100, rightConstant: 0, widthConstant: 340, heightConstant: 50).first
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    */
    
    // Customize controls constraints off screen by constant
    /*
    override func getControlConstraintsOffScreen() {
        pageControlBottomAnchor?.constant = 40
//        getStartedBottomAnchor?.constant = 3
    }
    */
    
    // Setup LoginCell
    /*
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard indexPath.item != pages.count else {
            guard let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: myLoginId, for: indexPath) as? MyLoginCell else { return UICollectionViewCell() }
            return loginCell
        }
        
        return setupPageCell(by: collectionView, and: indexPath)
    }
    */
}

