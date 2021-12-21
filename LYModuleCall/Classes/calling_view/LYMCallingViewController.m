//
//  LYMCallingViewController.m
//  LYModuleCall
//
//  Created by Luo Yu on 2021-08-07.
//	Email: indie.luo@gmail.com
//
//	The MIT License (MIT)
//
//	Copyright (c) 2021 骆昱(Luo Yu). All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "LYMCallingViewController.h"
#import <LYCategory/LYCategory.h>
#import "LYModuleCall.h"
#import <LYModuleCall/LYModuleCallingView.h>


@interface LYMCallingViewController () {
	
}
@end

@implementation LYMCallingViewController

// MARK: - ACTION

- (void)toggleCameraButtonPressed:(id)sender {}

- (void)toggleMicButtonPressed:(id)sender {}

- (void)flipCameraButtonPressed:(id)sender {}

- (void)hangupButtonPressed:(id)sender {
	NSLog(@"hang up");
	[self dismissViewControllerAnimated:YES completion:nil];
}

// MARK: - INIT

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		self.modalPresentationStyle = UIModalPresentationFullScreen;
	}
	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.modalPresentationStyle = UIModalPresentationFullScreen;
	}
	return self;
}

// MARK: - VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		if (_config == nil) {
			// MAKE DEFAULT CONFIG
			_config = [LYModuleCallingViewConfig defaultConfig];
		}
		
		LYModuleCallingView *view = [[LYModuleCallingView alloc] initWithConfig:_config];
		self.view = view;
		vMain = view;
		
		[[LYModuleCall module] setupLocalVideoView:vMain.cLocal andRemoteVideoView:vMain.cRemote];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	{
		[vMain.btnCam addTarget:self action:@selector(toggleCameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[vMain.btnMute addTarget:self action:@selector(toggleMicButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[vMain.btnFlip addTarget:self action:@selector(flipCameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[vMain.btnEnd addTarget:self action:@selector(hangupButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[[LYModuleCall module] videoJoined:^(NSUInteger uid) {
		NSLog(@"%@", @(uid));
		
	}];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	// JOIN
	[[LYModuleCall module] joinChannel:_agChannel byToken:_agToken];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	[[LYModuleCall module] leaveChannel];
}

// MARK: - METHOD
// MARK: PRIVATE METHOD

// MARK: NETWORKING
// MARK: PROPERTY
// MARK: BLOCK
// MARK: - DELEGATE
// MARK: - NOTIFICATION
// MARK:

@end
