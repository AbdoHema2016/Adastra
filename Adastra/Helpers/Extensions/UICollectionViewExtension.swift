//
//  UICollectionViewExtension.swift
//  Adastra
//
//  Created by Abdelrahman-Arw on 12/18/19.
//  Copyright © 2019 Abdelrahman-Arw. All rights reserved.
//

import UIKit
extension UICollectionView {
    func registerCell<T:UICollectionViewCell>(withCellType: T.Type) where T: NibLoadable & Reuseable {
        self.register(UINib(nibName: T.nibName, bundle: nil),
                      forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    func dequeueReusableCell<Base: BaseCollectionViewCell>(forIndexPath indexPath: IndexPath) -> Base {
        if let cell = self.dequeueReusableCell(withReuseIdentifier: Base.reuseIdentifier, for: indexPath) as? Base {
            return cell
        } else {
            fatalError("IHF: CollectionView can not dequeue cell with reusableIdentifier '\(Base.reuseIdentifier)' at indexPath '\(indexPath)'")
        }
    }
    func registerFooterView<T: UIView>(withViewType: T.Type) where T: NibLoadable & Reuseable {
        self.register(UINib(nibName: T.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableFooterView<T: UICollectionReusableView & Reuseable> (forIndexPath indexPath: IndexPath) -> T {
        if let footer = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T {
            return footer
        } else {
            fatalError("IHF: CollectionView can not dequeue footer view with reusableIdentifier '\(T.reuseIdentifier)' at indexPath '\(indexPath)'")
        }
    }
    
    func registerHeaderView<T: UIView>(withViewType: T.Type) where T: NibLoadable & Reuseable {
        self.register(UINib(nibName: T.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderView<T: BaseCollectionReusableView> (forIndexPath indexPath: IndexPath) -> T {
        if let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T {
            return header
        } else {
            fatalError("IHF: CollectionView can not dequeue header view with reusableIdentifier '\(T.reuseIdentifier)' at indexPath '\(indexPath)'")
        }
    }
}
