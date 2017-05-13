//
//  AppDelegate.h
//  AirFox
//
//  Created by Alex Ling on 11/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (void)share: (NSString *) URLString;

@end

