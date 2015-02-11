//
//  Beer.h
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *flavorDescription;
@property (nonatomic, assign) double abv;
@property (nonatomic, strong) NSString *breweryName;

- (instancetype) initWithName:(NSString *)name description:(NSString *)description abv:(double)abv brewery:(NSString *)brewery;

@end
