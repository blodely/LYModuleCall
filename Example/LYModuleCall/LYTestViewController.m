//
//  LYTestViewController.m
//  LYModuleCall_Example
//
//  Created by Rick on 2021/11/29.
//  Copyright © 2021 Rick L. All rights reserved.
//

#import "LYTestViewController.h"
#import <LYCategory/LYCategory.h>
#import <LYModuleCall/LYModuleCall.h>


@interface LYTestViewController ()

@end

@implementation LYTestViewController

- (void)callButtonPressed:(id)sender {
	
	LYMCallingViewController *vc = [[LYMCallingViewController alloc] init];
	vc.agChannel = @"";
	vc.agToken = @"";
	[self presentViewController:vc animated:YES completion:^{}];
}

- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	{
		UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[view roundedCornerRadius:30];
		[view border1Px];
		[self.view addSubview:view];
		
		[view.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-100].active = YES;
		[view.widthAnchor constraintEqualToConstant:60].active = YES;
		[view.heightAnchor constraintEqualToConstant:60].active = YES;
		
		[view addTarget:self action:@selector(callButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

@end
