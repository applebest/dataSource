# DataSource
封装tableView与collectionView的dataSource代理，优雅处理dataSource

# 初始化

self.dataSource = [[TableDataSource alloc] init];


## TableView调用
  ```
      [self.dataSource cellIdentifier:@"Identifier" numberSection:nil numberOfRows:^NSInteger(NSInteger section) {
       
        return 5;
    } configureCell:^(UITableViewCell *cell, NSIndexPath *indexPath) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"textLabel %ld + %ld",(long)indexPath.section,(long)indexPath.row];
    }];

  ```
  
## CollectionView调用
  ```
    [self.collectionDataSource cellIdentifier:@"Identifier" numberSection:^NSInteger{

          return 5;

      } numberOfItems:^NSInteger(NSInteger section) {

          return 10;

      } configureCell:^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
          cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0        blue:arc4random_uniform(256) / 255.0 alpha:1];
      }];
  
  
  ```
