//
//  BeerCell.h
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *abvLabel;

@end
