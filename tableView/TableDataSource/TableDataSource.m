//
//  tableDataSource.m
//  tableView
//
//  Created by clt on 2018/7/6.
//  Copyright © 2018年 clt. All rights reserved.
//

#import "TableDataSource.h"


@interface TableDataSource()

@property (nonatomic,copy) numberSectionBlock numbersection;

@property (nonatomic,copy) numberOfRowsInSectionBlock numberOfRows;

@property (nonatomic,copy) configureTableCellBlock configureCell;

@property (nonatomic,copy) identifierBlock identifier;

@end


@implementation TableDataSource


- (void)cellIdentifier:(identifierBlock)identifier numberSection:(numberSectionBlock)numbersection numberOfRows:(numberOfRowsInSectionBlock) numberOfRows configureCell:(configureTableCellBlock)configureCell{
    
    NSAssert(identifier     != nil, @"identifier is nil");
    NSAssert(numbersection  != nil, @"numbersection is nil");
    NSAssert(numberOfRows   != nil, @"numberOfRows is nil");
    NSAssert(configureCell  != nil, @"configureCell is nil");
    
    self.identifier = identifier;
    self.numbersection = numbersection;
    self.numberOfRows = numberOfRows;
    self.configureCell = configureCell;
    
}

#pragma mark ————— TableViewDataSource代理 —————
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return !self.numbersection ? 1 : self.numbersection();
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRows(section);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier(indexPath) forIndexPath:indexPath];
    self.configureCell(cell, indexPath);
    return cell;
}

#pragma mark ————— dealloc —————
- (void)dealloc{
    self.numbersection = nil;
    self.numberOfRows = nil;
    self.configureCell = nil;
    self.identifier = nil;
}

@end
