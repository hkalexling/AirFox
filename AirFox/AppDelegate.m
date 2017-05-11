//
//  AppDelegate.m
//  AirFox
//
//  Created by Alex Ling on 11/5/2017.
//  Copyright © 2017 Alex Ling. All rights reserved.
//

#import "AppDelegate.h"
#import "AFHTTPConnection.h"
#import <CocoaHTTPServer/HTTPServer.h>

@interface AppDelegate ()

@end

@implementation AppDelegate{
	NSStatusItem *item;
	NSMenuItem *portItem;
	HTTPServer *server;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	item.button.image = nil;
	
	NSMenu *menu = [NSMenu new];
	portItem = [[NSMenuItem alloc] initWithTitle:@"Port: " action:nil keyEquivalent:@""];
	[menu addItem:portItem];
	[menu addItem:[NSMenuItem separatorItem]];
	[menu addItem:[[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(quit) keyEquivalent:@""]];
	
	item.menu = menu;
	
	[self runServer: 8964];
}

- (void)updatePortNumber: (NSInteger) port {
	[portItem setTitle:[NSString stringWithFormat:@"Port: %@", @(port)]];
}

- (void)runServer: (NSInteger) port {
	server = [HTTPServer new];
	server.connectionClass = [AFHTTPConnection class];
	server.type = @"_http._tcp.";
	if (port > 0) {
		server.port = port;
	}
	
	NSError *error;
	[server start:&error];
	
	if (error) {
		if (error.domain == NSPOSIXErrorDomain && error.code == 48) {
			[self runServer:0]; // run with any available port
			return;
		}
		NSLog(@"error starting server: %@", error);
		return;
	}
	
	NSLog(@"port: %@", @(server.listeningPort));
	[self updatePortNumber:server.listeningPort];
}

- (void)quit {
	exit(0);
}

- (void)share: (NSString *) URLString {
	NSURL *URL = [NSURL URLWithString:URLString];
	if (!URL) return;
	NSSharingServicePicker *picker = [[NSSharingServicePicker alloc] initWithItems:@[URL]];
	[picker showRelativeToRect:item.button.bounds ofView:item.button preferredEdge:NSRectEdgeMaxY];
}

@end
