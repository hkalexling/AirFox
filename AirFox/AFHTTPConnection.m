//
//  AFHTTPConnection.m
//  AirFox
//
//  Created by Alex Ling on 11/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import "AFHTTPConnection.h"
#import "HTTPErrorResponse.h"
#import <CocoaHTTPServer/HTTPDataResponse.h>
#import "NSArray+QueryItemValue.h"
#import <CocoaHTTPServer/HTTPMessage.h>
#import "AppDelegate.h"
#import <CocoaHTTPServer/HTTPResponse.h>

@implementation AFHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path{
	
	if ([method isEqualToString:@"GET"]) {
		
		NSURLComponents *components = [NSURLComponents componentsWithString:path];
		NSArray *queryItems = components.queryItems;
		NSString *URLString = [queryItems queryItemValueForKey:@"url"];
		
		if (!URLString) return [[HTTPErrorResponse alloc] initWithErrorCode:400];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[(AppDelegate *)[NSApplication sharedApplication].delegate share:URLString];
		});
		
		return [[HTTPErrorResponse alloc] initWithErrorCode:200];
	}
	
	return [super httpResponseForMethod:method URI:path];
}

@end
