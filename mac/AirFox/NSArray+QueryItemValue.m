//
//  NSArray+QueryItemValue.m
//  AirFox
//
//  Created by Alex Ling on 11/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import "NSArray+QueryItemValue.h"

@implementation NSArray (QueryItemValue)

- (NSString *) queryItemValueForKey: (NSString *) key {
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@", key];
	NSURLQueryItem *item = [[self filteredArrayUsingPredicate:predicate] firstObject];
	if (!item) return nil;
	
	return item.value;
}

@end
