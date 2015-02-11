//
//  BeerDetailController.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/11/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "BeerDetailController.h"

@interface BeerDetailController ()

@property (nonatomic, weak) IBOutlet UILabel *brewery;
@property (nonatomic, weak) IBOutlet UILabel *abv;
@property (nonatomic, weak) IBOutlet UITextView *flavorDescription;

@end

@implementation BeerDetailController

#pragma mark - Instance Methods

- (void)setupInterface
{
    [self.flavorDescription.layoutManager setDelegate:self];
    
    [self.navigationItem setTitle:self.beer.name];
    
    [self.brewery setText:self.beer.breweryName];
    [self.abv setText:[NSString stringWithFormat:@"abv: %.2f", self.beer.abv]];
    [self.flavorDescription setText:self.beer.flavorDescription];
}

#pragma mark - Delegate Methods

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return 10.0;
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInterface];
}

@end
