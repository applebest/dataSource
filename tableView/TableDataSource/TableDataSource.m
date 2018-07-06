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

@property (nonatomic,copy) NSString *identifier;

@end


@implementation TableDataSource


- (void)cellIdentifier:(NSString *)identifier numberSection:(numberSectionBlock)numbersection numberOfRows:(numberOfRowsInSectionBlock) numberOfRows configureCell:(configureTableCellBlock)configureCell{
    
    self.identifier = identifier;
    self.numbersection = numbersection;
    self.numberOfRows = numberOfRows;
    self.configureCell = configureCell;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return !self.numbersection ? 1 : self.numbersection();
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRows(section);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    self.configureCell(cell, indexPath);
    return cell;
}


@end
