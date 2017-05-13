//
//  AFHTTPResponse.m
//  AirFox
//
//  Created by Alex Ling on 13/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import "AFHTTPResponse.h"

@implementation AFHTTPResponse{
	NSUInteger _status;
}

- (UInt64) offset {
	return 0;
}

- (void) setOffset:(UInt64)offset {}

- (NSData *) readDataOfLength:(NSUInteger)length {
	return nil;
}

- (UInt64) contentLength {
	return 0;
}

- (BOOL) isDone {
	return YES;
}

- (NSDictionary *)httpHeaders {
	return @{@"Access-Control-Allow-Origin": @"*"};
}

- (NSInteger) status {
	return _status;
}

- (void) setStatus:(NSUInteger)status {
	_status = status;
}

+ (AFHTTPResponse *)responseWithStatusCode: (NSUInteger) code {
	AFHTTPResponse *res = [AFHTTPResponse new];
	res.status = code;
	return res;
}

@end
