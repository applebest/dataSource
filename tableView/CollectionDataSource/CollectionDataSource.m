//
//  CollectionDataSource.m
//  tableView
//
//  Created by clt on 2018/7/6.
//  Copyright © 2018年 clt. All rights reserved.
//

#import "CollectionDataSource.h"

@interface CollectionDataSource()

@property (nonatomic,copy) numberSectionBlock numbersection;

@property (nonatomic,copy) numberOfItemsInSectionBlock numberOfItems;

@property (nonatomic,copy) configureCollectionCellBlock configureCell;

@property (nonatomic,copy) NSString *identifier;


@end

@implementation CollectionDataSource

- (void)cellIdentifier:(NSString *)identifier numberSection:(numberSectionBlock)numbersection numberOfItems:(numberOfItemsInSectionBlock) numberOfItems configureCell:(configureCollectionCellBlock)configureCell{
    NSAssert(identifier.length > 0, @"identifier is nil");
    NSAssert(numberOfItems != nil , @"numberOfItemsInSectionBlock is nil");
    NSAssert(configureCell != nil , @"configureCellBlock is nil");

    self.identifier = identifier;
    self.numbersection = numbersection;
    self.numberOfItems = numberOfItems;
    self.configureCell = configureCell;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return !self.numbersection ? 1 : self.numbersection();
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.numberOfItems(section);

}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifier forIndexPath:indexPath];
    self.configureCell(cell, indexPath);
    return cell;
    
}

@end
