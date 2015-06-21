//
//  SecondViewController.m
//  Lotto
//
//  Created by Faraz Bhojani on 2015-06-20.
//  Copyright (c) 2015 Faraz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSMutableArray *cells;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20.f, 0, 20.f, 0);
    layout.headerReferenceSize = CGSizeMake(100,1);
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.cells = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < 10; i ++ )
    {
        UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.shadowRadius = 1;
        cell.layer.shadowColor = [UIColor blackColor].CGColor;
        cell.layer.shadowOpacity = 1.0;
        cell.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        
        [self.cells addObject:cell];
    }
    
    [self.cells[1] setBackgroundView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Faraz.png"]]];
    [self.cells[2] setBackgroundView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dresden.JPG"]]];
    [self.cells[4] setBackgroundView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Nature.JPG"]]];
    
    UILabel *travelLabel = [[UILabel alloc] init];
    travelLabel.text = @"I love to travel. Whenever I have extra time and money I like to see different cultures";
    travelLabel.textAlignment = NSTextAlignmentCenter;
    travelLabel.numberOfLines = 0;
    
    [self.cells[0] setBackgroundView: travelLabel];
    
    UILabel *natureLabel = [[UILabel alloc] init];
    natureLabel.text = @"I like being around nature. I like walking through parks, and hiking through mountains";
    natureLabel.textAlignment = NSTextAlignmentCenter;
    natureLabel.numberOfLines = 0;

    [self.cells[3] setBackgroundView: natureLabel];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if( self.cells != nil )
        return self.cells[indexPath.item];
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2 *1.5f);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
