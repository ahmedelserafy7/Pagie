//
//  PagieHomeExtension.swift
//  Pagie
//
//  Created by Elser_10 on 8/21/21.
//

import UIKit

extension PagieHome {
    
    open func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        if pageNumber == pages.count {
            getControlConstraintsOffScreen()
        } else {
            pageControlBottomAnchor?.constant = -40
            getStartedBottomAnchor?.constant = -100
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard indexPath.item != pages.count else {
            guard let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginId, for: indexPath) as? LoginCell else { return UICollectionViewCell() }
            return loginCell
        }
        
        return setupPageCell(by: collectionView, and: indexPath)
    }
    
    public func setupPageCell(by collectionView: UICollectionView, and indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        let page = self.pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
     func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(getStartedButton)
        
        _ = collectionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        pageControlBottomAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 40, rightConstant: 0, widthConstant: 0, heightConstant: 60)[1]
        customizeButton(width: 0, height: 0)
    }
    
    @objc
    open func customizeButton(width w: CGFloat, height h: CGFloat) {
        let width = w != 0 ? w : 150
        let height = h != 0 ? h : 50
        getStartedBottomAnchor = getStartedButton.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 100, rightConstant: 0, widthConstant: width, heightConstant: height).first
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc
    open func getControlConstraintsOffScreen() {
        pageControlBottomAnchor?.constant = 40
        getStartedBottomAnchor?.constant = 100
    }
}
