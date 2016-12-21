//
//  ViewController.m
//  CollectionSentionLayout
//
//  Created by 王吉源 on 16/12/15.
//  Copyright © 2016年 王吉源. All rights reserved.
//

#import "ViewController.h"
#import "JYCollectionViewFlowLayout.h"
#import "CLImageCell.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,JYCollectionViewFlowLayoutDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *networkArray;
@end

@implementation ViewController
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        JYCollectionViewFlowLayout *layout = [JYCollectionViewFlowLayout new];
        layout.delegate = self;
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, kScreenHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        UINib *cellNib=[UINib nibWithNibName:@"CLImageCell" bundle:nil];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableView"];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _networkArray = @[@"http://c.hiphotos.baidu.com/image/pic/item/5bafa40f4bfbfbed91fbb0837ef0f736aec31faf.jpg",
                      @"http://g.hiphotos.baidu.com/image/pic/item/4b90f603738da977772000d7b651f8198618e33b.jpg",
                      @"http://h.hiphotos.baidu.com/image/pic/item/6609c93d70cf3bc798e14b10d700baa1cc112a6c.jpg",
                      @"http://b.hiphotos.baidu.com/image/pic/item/0823dd54564e925838c205c89982d158ccbf4e26.jpg",
                      @"http://a.hiphotos.baidu.com/image/pic/item/279759ee3d6d55fb924d52c869224f4a21a4dd50.jpg",
                      @"http://g.hiphotos.baidu.com/image/pic/item/8b82b9014a90f603d51af2a13d12b31bb151edaa.jpg",
                      @"http://d.hiphotos.baidu.com/image/pic/item/8c1001e93901213fabe11ca757e736d12e2e95fe.jpg",
                      @"http://a.hiphotos.baidu.com/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=7912add39482d158af8f51e3e16372bd/c2fdfc039245d6887c249999acc27d1ed21b24ec.jpg"
                      ,@"http://a.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=840d4f499deef01f591910978197f240/78310a55b319ebc487c780b48b26cffc1e17165b.jpg",
                      @"http://b.hiphotos.baidu.com/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=500335535b82b2b7b392319650c4a08a/e4dde71190ef76c656a8567c9f16fdfaaf51676b.jpg"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section+1;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 0, 0, 0);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CLImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    [cell setImage:[_networkArray objectAtIndex:indexPath.item]];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionReusableView" forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view.backgroundColor = [UIColor redColor];
    }else{
        view.backgroundColor = [UIColor greenColor];
    }
    return view;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
}

@end

