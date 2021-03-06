//
//  BCDataService.h
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@interface BCDataService : NSObject

+ (void)loadBeersWithBlock:(void (^) (NSArray *dataFields, NSError *error)) block;

@end
