//
//  BCDataAdapter.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "BCDataAdapter.h"

#import "Beer.h"
#import "NetworkConstants.h"

@implementation BCDataAdapter

+ (NSArray *)convertDataToBeers:(NSArray *)data
{
    NSMutableArray *beers = [[NSMutableArray alloc] init];
    
    for (NSDictionary *beer in data)
    {
        Beer *currentBeer = [self convertDataToBeer:beer];
        [beers addObject:currentBeer];
    }
    
    return beers;
}

#pragma mark - Private Methods

+ (Beer *)convertDataToBeer:(NSDictionary *)data
{
    double abv = [data[kAbvKey] doubleValue];
    Beer *beer = [[Beer alloc] initWithName:data[kNameKey] description:data[kDescriptionKey] abv:abv brewery:data[kBreweryKey][kNameKey]];
    
    return beer;
}

@end
