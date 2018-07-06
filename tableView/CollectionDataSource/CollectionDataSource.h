//
//  CollectionDataSource.h
//  tableView
//
//  Created by clt on 2018/7/6.
//  Copyright © 2018年 clt. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSInteger(^numberSectionBlock)(void);

typedef NSInteger(^numberOfItemsInSectionBlock)(NSInteger section);

typedef void(^configureCollectionCellBlock)(UICollectionViewCell *cell,NSIndexPath *indexPath);

@interface CollectionDataSource : NSObject<UICollectionViewDataSource>

- (void)cellIdentifier:(NSString *)identifier numberSection:(numberSectionBlock)numbersection numberOfItems:(numberOfItemsInSectionBlock) numberOfItems configureCell:(configureCollectionCellBlock)configureCell;




@end
