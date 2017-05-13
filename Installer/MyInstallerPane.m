//
//  MyInstallerPane.m
//  Installer
//
//  Created by Alex Ling on 14/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import "MyInstallerPane.h"

@implementation MyInstallerPane

- (NSString *)title
{
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"PaneTitle" value:nil table:nil];
}

@end
