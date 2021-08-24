//
//  PagieHome.swift
//  PagieHomeTest
//
//  Created by Elser_10 on 8/23/21.
//

import UIKit

open class PagieHome: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
     public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    public lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 1
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 8/255, green: 175/255, blue: 106/255, alpha: 1)
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    @objc
    private func handlePageControl() {
        // currentPage here equals to "self.pages.count", b/c currentPage starts from 0 like index, so when we go to the last page, which is login page, we'll be at the last/nth index in the pages array, and it'll be pages.count.
        // currentPage differs from numberOfPages
        if pageControl.currentPage == self.pages.count {
            getControlConstraintsOffScreen()
            UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    public lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 8/255, green: 175/255, blue: 106/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleGetStartedButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    open func handleGetStartedButton() {
        pageControl.currentPage = pages.count - 1
        next()
    }
    
     private func next() {
        // When we move into the second last page, do that the next time.
        if pageControl.currentPage == self.pages.count - 1 {
            getControlConstraintsOffScreen()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    public var pageControlBottomAnchor: NSLayoutConstraint?
    public var getStartedBottomAnchor: NSLayoutConstraint?
    public let cellId = "cellId"
    let loginId = "loginId"
    public var pages = [Page]()
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginId)
        
        setupViews()
    }
}

