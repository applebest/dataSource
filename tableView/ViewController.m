//
//  ViewController.m
//  tableView
//
//  Created by clt on 2018/7/6.
//  Copyright © 2018年 clt. All rights reserved.
//

#import "ViewController.h"
#import "TableDataSource.h"
#import "CollectionDataSource.h"

#ifndef COLLECTION_DEF
#define COLLECTION_DEF
#endif


@interface ViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) TableDataSource *dataSource;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) CollectionDataSource *collectionDataSource;

@end

@implementation ViewController


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 1;
        _tableView.sectionHeaderHeight = 15;
        _tableView.rowHeight = 45;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    }
    return _tableView;
}

- (TableDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[TableDataSource alloc] init];
    }
    return _dataSource;
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        layout.itemSize = CGSizeMake(screenWidth / 3 - 20, screenWidth / 6);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 15;
        layout.headerReferenceSize = CGSizeMake(screenWidth, 15);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Identifier"];
    }
    
    return _collectionView;
    
}

- (CollectionDataSource *)collectionDataSource{
    if (!_collectionDataSource) {
        _collectionDataSource = [[CollectionDataSource alloc] init];
    }
    return _collectionDataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    
    
}

- (void)setupUI{

#ifdef COLLECTION_DEF
    
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.collectionDataSource cellIdentifier:^NSString *(NSIndexPath *indexPath) {
        return @"Identifier";
    } numberSection:^NSInteger{
        return 5;
    } numberOfItems:^NSInteger(NSInteger section) {
        return 10;
    } configureCell:^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
        cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    }];
    
    
    self.collectionView.dataSource = self.collectionDataSource;
    [self.view addSubview:self.collectionView];
    
#else
  
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    [self.dataSource cellIdentifier:^NSString *(NSIndexPath *indexPath) {
        return @"Identifier";
    } numberSection:nil numberOfRows:^NSInteger(NSInteger section) {
       
        return 5;
    } configureCell:^(UITableViewCell *cell, NSIndexPath *indexPath) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"textLabel %ld + %ld",(long)indexPath.section,(long)indexPath.row];
    }];
    
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
#endif
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
#ifdef COLLECTION_DEF
    
    self.collectionView.frame = self.view.bounds;
    
#else
    self.tableView.frame = self.view.bounds;
    
#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
