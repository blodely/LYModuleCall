//
//  LYModuleCallingViewConfig.m
//  LYModuleCall
//
//  Created by Luo Yu on 2021-08-14.
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

#import "LYModuleCallingViewConfig.h"
#import <LYCategory/LYCategory.h>


@interface LYModuleCallingViewConfig () {}
@end

@implementation LYModuleCallingViewConfig

+ (instancetype)defaultConfig {
	LYModuleCallingViewConfig *config = [[LYModuleCallingViewConfig alloc] init];
	
	config.themeColor = [UIColor colorWithHex:@"#0072ff" andAlpha:1.0];
	
	config.featureButtonBgColor = [UIColor colorWithHex:@"#f2f4f7" andAlpha:1.0];
	config.featureButtonIcoColor = [UIColor lightGrayColor];
	
	config.hangupButtonBgColor = [UIColor colorWithHex:@"#ec4646" andAlpha:1];
	//[UIColor colorWithHex:@"#e93232" andAlpha:1.0];
	config.hangupButtonIcoColor = [UIColor colorWithHex:@"#ffffff" andAlpha:1.0];
	
	config.cameraButtonOn = @"btn-ico-video-on";
	config.cameraButtonOff = @"btn-ico-video-off";
	config.micButtonOn = @"btn-ico-mic-on";
	config.micButtonOff = @"btn-ico-mic-off";
	config.toggleCameraButton = @"btn-ico-flip";
	config.hangupButton = @"btn-ico-hangup";
	
	return config;
}

@end
