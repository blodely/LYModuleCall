//
//  LYModuleCallingViewConfig.h
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

#import <Foundation/Foundation.h>


@interface LYModuleCallingViewConfig : NSObject

/// feature button: camera switch-on image
@property (nonatomic, copy) NSString *cameraButtonOn;

/// feature button: camera switch-off image
@property (nonatomic, copy) NSString *cameraButtonOff;

/// feature button: mic switch-on image
@property (nonatomic, copy) NSString *micButtonOn;

/// feature button: mic switch-off image
@property (nonatomic, copy) NSString *micButtonOff;

/// feature button: toggle camera image
@property (nonatomic, copy) NSString *toggleCameraButton;

/// feature button: hangup phone image
@property (nonatomic, copy) NSString *hangupButton;

@property (nonatomic, copy) UIColor *themeColor;

@property (nonatomic, copy) UIColor *featureButtonBgColor;
@property (nonatomic, copy) UIColor *featureButtonIcoColor;

@property (nonatomic, copy) UIColor *hangupButtonBgColor;
@property (nonatomic, copy) UIColor *hangupButtonIcoColor;

+ (instancetype)defaultConfig;

@end
