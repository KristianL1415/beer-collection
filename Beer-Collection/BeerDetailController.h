//
//  BeerDetailController.h
//  Beer-Collection
//
//  Created by Kristian Lien on 2/11/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Beer.h"

@interface BeerDetailController : UIViewController <NSLayoutManagerDelegate>

@property (nonatomic, strong) Beer *beer;

@end
