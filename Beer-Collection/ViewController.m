//
//  ViewController.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "ViewController.h"

#import "StringConstants.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *beers;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - Collection View Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBeerCell forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.beers count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Collection View Flow Layout

// Returns the size for each collection view item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Set this value
    CGSize cellSpacing = CGSizeMake(100.0, 100.0);
    
    return cellSpacing;
}

// Returns spacing between cells, headers and footers
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0);
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kBeerCell];
    self.beers = [[NSArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", nil];
}

@end
