//
//  tableDataSource.h
//  tableView
//
//  Created by clt on 2018/7/6.
//  Copyright © 2018年 clt. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSInteger(^numberSectionBlock)(void);

typedef NSInteger(^numberOfRowsInSectionBlock)(NSInteger section);

typedef void(^configureTableCellBlock)(UITableViewCell *cell,NSIndexPath *indexPath);

typedef NSString*(^identifierBlock)(NSIndexPath *indexPath);

@interface TableDataSource : NSObject<UITableViewDataSource>


- (void)cellIdentifier:(identifierBlock)identifier numberSection:(numberSectionBlock)numbersection numberOfRows:(numberOfRowsInSectionBlock) numberOfRows configureCell:(configureTableCellBlock)configureCell;

@end
