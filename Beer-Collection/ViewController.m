//
//  ViewController.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "ViewController.h"

#import "Beer.h"
#import "BeerCell.h"
#import "BCDataService.h"
#import "StringConstants.h"
#import "BeerDetailController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *beers;

@property (nonatomic, strong) Beer *currentBeer;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - Collection View Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BeerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBeerCell forIndexPath:indexPath];
    
    Beer *beer = [self.beers objectAtIndex:indexPath.row];
    [cell.nameLabel setText:[beer name]];
    [cell.abvLabel setText:[NSString stringWithFormat:@"abv: %.2f",[beer abv]]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.beers count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentBeer = [self.beers objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:kBeerSegue sender:nil];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Collection View Flow Layout

// Returns the size for each collection view item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sideLength = (self.view.frame.size.width - 40.0) / 3.0;
    CGSize cellSpacing = CGSizeMake(sideLength, sideLength);
    
    return cellSpacing;
}

// Returns spacing between cells, headers and footers
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    [BCDataService loadBeersWithBlock:^(NSArray *dataFields, NSError *error) {
        if (error != nil)
        {
            NSLog(@"Error loading beers: %@", error.localizedDescription);
        }
        else
        {
            self.beers = dataFields;
            [self.collectionView reloadData];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kBeerSegue])
    {
        BeerDetailController *destination = (BeerDetailController *) segue.destinationViewController;
        
        [destination setBeer:self.currentBeer];
    }
}

@end
