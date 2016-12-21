//
//  JYCollectionViewFlowLayout.m
//  魔哆魔哆
//
//  Created by 王吉源 on 16/12/8.
//  Copyright © 2016年 王吉源. All rights reserved.
//

#import "JYCollectionViewFlowLayout.h"
#define WIDTH self.collectionView.frame.size.width
@interface JYCollectionViewFlowLayout ()

@property(nonatomic,strong)NSArray <UICollectionViewLayoutAttributes *> *itemsAttributes;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, strong) NSMutableArray *supplementaryAttributes;
@end
@implementation JYCollectionViewFlowLayout
-(instancetype)init{
    if (self = [super init]) {
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        _supplementaryAttributes = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)prepareLayout{
    NSInteger countSection = [self.collectionView numberOfSections];
    
    //创建一个临时可变数组暂时盛放布局
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    for (NSInteger section = 0; section < countSection; section++) {//
        NSInteger count = [self.collectionView numberOfItemsInSection:section];
    //这个属性，这里暂时用不到
//        CGFloat minimumInteritemSpacing = [self minimumInteritemSpacingForSection:section];
//        CGFloat minimumLineSpacing = [self minimumLineSpacingForSection:section];
        UIEdgeInsets sectionInset = [self sectionInsetForSection:section];
        CGFloat headerHeight = [self headerHeightForSection:section];
        CGFloat footerHeight = [self footerHeightForSection:section];
        
        self.contentHeight += sectionInset.top;
        NSMutableDictionary *supplementary = [[NSMutableDictionary alloc] initWithCapacity:2];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        
        attributes.frame = CGRectMake(0, self.contentHeight, self.collectionView.frame.size.width, headerHeight);
        self.contentHeight += headerHeight;
        [arr addObject:attributes];
        [supplementary setObject:attributes forKey:UICollectionElementKindSectionHeader];
        
        
        for (NSInteger row = 0; row<count; row++) {
            //创建布局属性
            UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:row inSection:section]];
            CGRect itemFrame;
            switch (count) {
                case 1:
                    itemFrame = [self imagesOfOneWith:row];
                    break;
                case 2:
                    itemFrame = [self imagesOfTwoWith:row];
                    break;
                case 3:
                    itemFrame = [self imagesOfThreeWith:row];
                    break;
                case 4:
                    itemFrame = [self imagesOfFourWith:row];
                    break;
                case 5:
                    itemFrame = [self imagesOfFiveWith:row];
                    break;
                case 6:
                    itemFrame = [self imagesOfSixWith:row];
                    break;
                case 7:
                    itemFrame = [self imagesOfSevenWith:row];
                    break;
                case 8:
                    itemFrame = [self imagesOfEightWith:row];
                    break;
                case 9:
                    itemFrame = [self imagesOfNineWith:row];
                    break;
                case 10:
                    itemFrame = [self imagesOfTenWith:row];
                    break;
                default:
                    break;
            }
            CGRect rect = itemFrame;
            att.frame = CGRectMake(rect.origin.x, rect.origin.y+self.contentHeight, rect.size.width, rect.size.height);
            [arr addObject:att];
        }
        switch (count) {
            case 1:
                self.contentHeight+=WIDTH/2;
                break;
            case 2:
                self.contentHeight+=WIDTH/2;
                break;
            case 3:
                self.contentHeight+=WIDTH;
                break;
            case 4:
                self.contentHeight+=WIDTH*5/6;
                break;
            case 5:
                self.contentHeight+=WIDTH*7/6;
                break;
            case 6:
                self.contentHeight+=WIDTH;
                break;
            case 7:
                self.contentHeight+=WIDTH*7/6;
                break;
            case 8:
                self.contentHeight+=WIDTH*7/6;
                break;
            case 9:
                self.contentHeight+=WIDTH;
                break;
            case 10:
                self.contentHeight+=WIDTH;
                break;
            default:
                break;
        }
        UICollectionViewLayoutAttributes *attributes1 = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        attributes1.frame = CGRectMake(0, self.contentHeight, self.collectionView.frame.size.width, footerHeight);
        self.contentHeight +=footerHeight;
        [arr addObject:attributes1];
        [supplementary setObject:attributes1 forKey:UICollectionElementKindSectionFooter];
        [self.supplementaryAttributes addObject:supplementary];
        self.contentHeight += sectionInset.bottom;
//        self.contentHeight += minimumLineSpacing;
    }

    self.itemsAttributes = [arr copy];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSPredicate *pred = [NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return CGRectIntersectsRect(rect, evaluatedObject.frame);
    }];
    NSArray *arr = [self.itemsAttributes filteredArrayUsingPredicate:pred];
    return arr;
    return self.itemsAttributes;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return self.supplementaryAttributes[indexPath.section][kind];
}
#pragma mark-不同数量的布局
-(CGRect)imagesOfOneWith:(NSInteger)row{
    return CGRectMake(0, 0, WIDTH, WIDTH/2);
}


-(CGRect)imagesOfTwoWith:(NSInteger)row{
    CGFloat _w = WIDTH/2;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, _w, WIDTH/2);
            break;
        case 1:
            itemFrame = CGRectMake(_w, 0, _w, WIDTH/2);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfThreeWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat smallH = bigH;
    CGFloat smallW = WIDTH/2;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, WIDTH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(0, bigH, smallW, smallH);
            break;
        case 2:
            itemFrame = CGRectMake(smallW, bigH, smallW, smallH);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfFourWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat smallW = WIDTH/3;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, WIDTH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(0, bigH, smallW, smallW);
            break;
        case 2:
            itemFrame = CGRectMake(smallW, bigH, smallW, smallW);
            break;
        case 3:
            itemFrame = CGRectMake(smallW*2, bigH, smallW, smallW);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfFiveWith:(NSInteger)row{
    CGFloat rightW = WIDTH/3;
    CGFloat bigH = rightW * 2;
    CGFloat downW = WIDTH/2;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, bigH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(bigH, 0, rightW, rightW);
            break;
        case 2:
            itemFrame = CGRectMake(bigH, rightW, rightW, rightW);
            break;
        case 3:
            itemFrame = CGRectMake(0, bigH, downW, downW);
            break;
        case 4:
            itemFrame = CGRectMake(downW, bigH, downW, downW);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfSixWith:(NSInteger)row{
    CGFloat small = WIDTH/3;
    CGFloat bigH = small * 2;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, bigH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(bigH, 0, small, small);
            break;
        case 2:
            itemFrame = CGRectMake(bigH, small, small, small);
            break;
        case 3:
            itemFrame = CGRectMake(0, bigH, small, small);
            break;
        case 4:
            itemFrame = CGRectMake(small, bigH, small, small);
            break;
        case 5:
            itemFrame = CGRectMake(small*2, bigH, small, small);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfSevenWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat small = WIDTH/3;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, WIDTH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(0, bigH, small, small);
            break;
        case 2:
            itemFrame = CGRectMake(small, bigH, small, small);
            break;
        case 3:
            itemFrame = CGRectMake(small*2, bigH, small, small);
            break;
        case 4:
            itemFrame = CGRectMake(0, bigH+small, small, small);
            break;
        case 5:
            itemFrame = CGRectMake(small, bigH+small, small, small);
            break;
        case 6:
            itemFrame = CGRectMake(small*2, bigH+small, small, small);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfEightWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat small = WIDTH/3;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, bigH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(bigH, 0, bigH, bigH);
            break;
        case 2:
            itemFrame = CGRectMake(0, bigH, small, small);
            break;
        case 3:
            itemFrame = CGRectMake(small, bigH, small, small);
            break;
        case 4:
            itemFrame = CGRectMake(small*2, bigH, small, small);
            break;
        case 5:
            itemFrame = CGRectMake(0, bigH+small, small, small);
            break;
        case 6:
            itemFrame = CGRectMake(small, bigH+small, small, small);
            break;
        case 7:
            itemFrame = CGRectMake(small*2, bigH+small, small, small);
            break;
        default:
            break;
    }
    return itemFrame;
}

-(CGRect)imagesOfNineWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat small = WIDTH/4;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, WIDTH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(0, bigH, small, small);
            break;
        case 2:
            itemFrame = CGRectMake(small, bigH, small, small);
            break;
        case 3:
            itemFrame = CGRectMake(small*2, bigH, small, small);
            break;
        case 4:
            itemFrame = CGRectMake(small*3, bigH, small, small);
            break;
        case 5:
            itemFrame = CGRectMake(0, bigH+small, small, small);
            break;
        case 6:
            itemFrame = CGRectMake(small, bigH+small, small, small);
            break;
        case 7:
            itemFrame = CGRectMake(small*2, bigH+small, small, small);
            break;
        case 8:
            itemFrame = CGRectMake(small*3, bigH+small, small, small);
            break;
        default:
            break;
    }
    return itemFrame;
}
-(CGRect)imagesOfTenWith:(NSInteger)row{
    CGFloat bigH = WIDTH/2;
    CGFloat small = WIDTH/4;
    CGRect itemFrame;
    switch (row) {
        case 0:
            itemFrame = CGRectMake(0, 0, bigH, bigH);
            break;
        case 1:
            itemFrame = CGRectMake(bigH, 0, bigH, bigH);
            break;
        case 2:
            itemFrame = CGRectMake(0, bigH, small, small);
            break;
        case 3:
            itemFrame = CGRectMake(small, bigH, small, small);
            break;
        case 4:
            itemFrame = CGRectMake(small*2, bigH, small, small);
            break;
        case 5:
            itemFrame = CGRectMake(small*3, bigH, small, small);
            break;
        case 6:
            itemFrame = CGRectMake(0, bigH+small, small, small);
            break;
        case 7:
            itemFrame = CGRectMake(small, bigH+small, small, small);
            break;
        case 8:
            itemFrame = CGRectMake(small*2, bigH+small, small, small);
            break;
        case 9:
            itemFrame = CGRectMake(small*3, bigH+small, small, small);
            break;
        default:
            break;
    }
    return itemFrame;
}
#pragma mark -
- (CGFloat)headerHeightForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:heightForHeaderInSection:)]) {
        self.headerHeight = [self.delegate collectionView:self.collectionView layout:self heightForHeaderInSection:section];
    }
    
    return self.headerHeight;
}
- (CGFloat)footerHeightForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:heightForFooterInSection:)]) {
        self.footerHeight = [self.delegate collectionView:self.collectionView layout:self heightForFooterInSection:section];
    }
    
    return self.footerHeight;
}
- (UIEdgeInsets)sectionInsetForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        self.sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }
    
    return self.sectionInset;
}
#pragma mark -这个demo里面用不到，这里先先写上
- (CGFloat)minimumLineSpacingForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        self.minimumLineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }
    
    return self.minimumLineSpacing;
}
- (CGFloat)minimumInteritemSpacingForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        self.minimumInteritemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    
    return self.minimumInteritemSpacing;
}
@end
