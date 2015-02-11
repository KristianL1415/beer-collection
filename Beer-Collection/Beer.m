//
//  Beer.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (instancetype) initWithName:(NSString *)name description:(NSString *)description abv:(double)abv brewery:(NSString *)brewery
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.flavorDescription = description;
        self.abv = abv;
        self.breweryName = brewery;
    }
    
    return self;
}

@end
