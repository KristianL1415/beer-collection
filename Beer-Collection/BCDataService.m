//
//  BCDataService.m
//  Beer-Collection
//
//  Created by Kristian Lien on 2/10/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "BCDataService.h"

#import "BCDataAdapter.h"
#import "NetworkConstants.h"

@implementation BCDataService

+ (void)loadBeersWithBlock:(void (^) (NSArray *dataFields, NSError *error)) block
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseUrlString, kBeersSlug];
    AFHTTPRequestOperation *operation = [self createOperationWithUrlString:urlString];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *response = (NSArray *)responseObject[kBeersKey];
        NSArray *beers = [BCDataAdapter convertDataToBeers:response];
        block(beers, nil);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
    
    [operation start];
}

#pragma mark - Private Methods

+ (AFHTTPRequestOperation *)createOperationWithUrlString:(NSString *)urlString
{
    NSURL *requestUrl = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    return operation;
}

@end
