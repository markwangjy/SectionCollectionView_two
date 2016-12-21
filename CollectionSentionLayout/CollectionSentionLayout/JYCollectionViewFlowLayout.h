//
//  JYCollectionViewFlowLayout.h
//  魔哆魔哆
//
//  Created by 王吉源 on 16/12/8.
//  Copyright © 2016年 王吉源. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JYCollectionViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>
@optional

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;

@end
@interface JYCollectionViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, weak) id<JYCollectionViewFlowLayoutDelegate> delegate;
@property (nonatomic, assign) CGFloat headerHeight; // default 0
@property (nonatomic, assign) CGFloat footerHeight; // default 0
@end
