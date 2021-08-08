//
//  LYModuleCallingView.m
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

#import "LYModuleCallingView.h"
#import <LYCategory/LYCategory.h>


@interface LYModuleCallingView () {
	__weak UIView *vControls;
}
@end

@implementation LYModuleCallingView

- (instancetype)init {
	if (self = [super initWithFrame:(CGRect){0, 0, WIDTH, HEIGHT}]) {
		[self initial];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		[self initial];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	frame.origin = CGPointZero;
	if (self = [super initWithFrame:frame]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	
	self.backgroundColor = [UIColor whiteColor];
	
	{
		// MARK: REMOTE VIDEO VIEW
		UIControl *view = [[UIControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_cRemote = view;
		
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
	}
	
	{
		// MARK: LOCAL VIDEO VIEW
		UIControl *view = [[UIControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_cLocal = view;
		
		[view.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:32].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16].active = YES;
		[view.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.25].active = YES;
		[view.heightAnchor constraintEqualToAnchor:view.widthAnchor multiplier:1.33].active = YES;
	}
	
	{
		// MARK: CONTROLS AREA
		UIView *view = [[UIView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		vControls = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-60].active = YES;
		[view.heightAnchor constraintEqualToConstant:60].active = YES;
	}
	
	{
		CGFloat side = 60;
		CGFloat radius = 30;
		
		{
			UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
			view.translatesAutoresizingMaskIntoConstraints = NO;
			[view roundedCornerRadius:radius];
			[vControls addSubview:view];
			_btnCam = view;
			
			[view.widthAnchor constraintEqualToConstant:side].active = YES;
			[view.heightAnchor constraintEqualToConstant:side].active = YES;
			[view.topAnchor constraintEqualToAnchor:vControls.topAnchor].active = YES;
			[view.bottomAnchor constraintEqualToAnchor:vControls.bottomAnchor].active = YES;
		}
		
		{
			UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
			view.translatesAutoresizingMaskIntoConstraints = NO;
			[view roundedCornerRadius:radius];
			[vControls addSubview:view];
			_btnMute = view;
			
			[view.widthAnchor constraintEqualToConstant:side].active = YES;
			[view.heightAnchor constraintEqualToConstant:side].active = YES;
			[view.topAnchor constraintEqualToAnchor:vControls.topAnchor].active = YES;
			[view.bottomAnchor constraintEqualToAnchor:vControls.bottomAnchor].active = YES;
		}
		
		{
			UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
			view.translatesAutoresizingMaskIntoConstraints = NO;
			[view roundedCornerRadius:radius];
			[vControls addSubview:view];
			_btnFlip = view;
			
			[view.widthAnchor constraintEqualToConstant:side].active = YES;
			[view.heightAnchor constraintEqualToConstant:side].active = YES;
			[view.topAnchor constraintEqualToAnchor:vControls.topAnchor].active = YES;
			[view.bottomAnchor constraintEqualToAnchor:vControls.bottomAnchor].active = YES;
		}
		
		{
			UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
			view.translatesAutoresizingMaskIntoConstraints = NO;
			[view roundedCornerRadius:radius];
			[vControls addSubview:view];
			_btnEnd = view;
			
			[view.widthAnchor constraintEqualToConstant:side].active = YES;
			[view.heightAnchor constraintEqualToConstant:side].active = YES;
			[view.topAnchor constraintEqualToAnchor:vControls.topAnchor].active = YES;
			[view.bottomAnchor constraintEqualToAnchor:vControls.bottomAnchor].active = YES;
		}
		
		{
			UILayoutGuide *layoutguide[5];
			for (NSInteger i = 0; i < 5; i++) {
				layoutguide[i] = [[UILayoutGuide alloc] init];
				[vControls addLayoutGuide:layoutguide[i]];
				
				[layoutguide[i].heightAnchor constraintEqualToConstant:1].active = YES;
				[layoutguide[i].centerYAnchor constraintEqualToAnchor:vControls.centerYAnchor].active = YES;
				
				if (i > 0) {
					[layoutguide[i].widthAnchor constraintEqualToAnchor:layoutguide[i - 1].widthAnchor].active = YES;
				}
			}
			
			[layoutguide[0].leftAnchor constraintEqualToAnchor:vControls.leftAnchor].active = YES;
			[layoutguide[0].trailingAnchor constraintEqualToAnchor:_btnCam.leadingAnchor].active = YES;
			[layoutguide[1].leadingAnchor constraintEqualToAnchor:_btnCam.trailingAnchor].active = YES;
			[layoutguide[1].trailingAnchor constraintEqualToAnchor:_btnMute.leadingAnchor].active = YES;
			[layoutguide[2].leadingAnchor constraintEqualToAnchor:_btnMute.trailingAnchor].active = YES;
			[layoutguide[2].trailingAnchor constraintEqualToAnchor:_btnFlip.leadingAnchor].active = YES;
			[layoutguide[3].leadingAnchor constraintEqualToAnchor:_btnFlip.trailingAnchor].active = YES;
			[layoutguide[3].trailingAnchor constraintEqualToAnchor:_btnEnd.leadingAnchor].active = YES;
			[layoutguide[4].leadingAnchor constraintEqualToAnchor:_btnEnd.trailingAnchor].active = YES;
			[layoutguide[4].rightAnchor constraintEqualToAnchor:vControls.rightAnchor].active = YES;
		}
	}
	
	{
		for (UIView *one in self.subviews) {
			if ([one isKindOfClass:[UIButton class]]) {
				[one border1Px];
			}
			for (UIView *two in one.subviews) {
				if ([two isKindOfClass:[UIButton class]]) {
					[two border1Px];
				}
			}
		}
	}
}

@end
