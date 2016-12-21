//
//  CLImageCell.h
//  CLCoolView
//
//  Created by 王吉源 on 16/7/19.
//  Copyright © 2016年 王吉源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)setImage:(id)image;

@end
