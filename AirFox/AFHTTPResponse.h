//
//  AFHTTPResponse.h
//  AirFox
//
//  Created by Alex Ling on 13/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPResponse.h"

@interface AFHTTPResponse : NSObject<HTTPResponse>

- (void) setStatus: (NSUInteger) status;
+ (AFHTTPResponse *)responseWithStatusCode: (NSUInteger) code;

@end
