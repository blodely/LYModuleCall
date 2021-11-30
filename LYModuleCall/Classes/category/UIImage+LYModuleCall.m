//
//  UIImage+LYModuleCall.m
//  LYModuleCall
//
//  Created by Luo Yu on 2021-11-20.
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

#import "UIImage+LYModuleCall.h"
#import "NSBundle+LYModuleCall.h"


@implementation UIImage (LYModuleCall)

+ (UIImage *)imageInModCallNamed:(NSString *)name {
	
	if (@available(iOS 13.0, *)) {
		return [UIImage imageNamed:name inBundle:[NSBundle moduleCallResourceBundle] withConfiguration:nil];
	} else {
		return [UIImage imageNamed:name inBundle:[NSBundle moduleCallResourceBundle] compatibleWithTraitCollection:nil];
	}
}

+ (UIImage *)templateInModCallNamed:(NSString *)name {

	if (@available(iOS 13.0, *)) {
		return [[UIImage imageNamed:name inBundle:[NSBundle moduleCallResourceBundle] withConfiguration:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	} else {
		// FALLBACK ON EARLIER VERSIONS
		return [[UIImage imageNamed:name inBundle:[NSBundle moduleCallResourceBundle] compatibleWithTraitCollection:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	}
}

@end
