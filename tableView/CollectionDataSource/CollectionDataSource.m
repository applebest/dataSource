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

@property (nonatomic,copy) identifierBlock identifier;


@end

@implementation CollectionDataSource

- (void)cellIdentifier:(identifierBlock)identifier numberSection:(numberSectionBlock)numbersection numberOfItems:(numberOfItemsInSectionBlock) numberOfItems configureCell:(configureCollectionCellBlock)configureCell{
    
    NSAssert(identifier      != nil, @"identifier is nil");
    NSAssert(numbersection   != nil, @"numbersection is nil");
    NSAssert(numberOfItems   != nil, @"numberOfRows is nil");
    NSAssert(configureCell   != nil, @"configureCell is nil");
    
    self.identifier = identifier;
    self.numbersection = numbersection;
    self.numberOfItems = numberOfItems;
    self.configureCell = configureCell;
    
}

#pragma mark ————— UICollectionViewDataSource代理 —————
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return !self.numbersection ? 1 : self.numbersection();
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.numberOfItems(section);

}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifier(indexPath) forIndexPath:indexPath];
    self.configureCell(cell, indexPath);
    return cell;
    
}

#pragma mark ————— dealloc —————
- (void)dealloc{
    self.numbersection = nil;
    self.numberOfItems = nil;
    self.configureCell = nil;
    self.identifier = nil;
}

@end
