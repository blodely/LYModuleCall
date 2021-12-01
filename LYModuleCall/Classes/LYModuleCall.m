//
//  LYModuleCall.m
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

#import "LYModuleCall.h"
#import <LYCategory/LYCategory.h>
#import <AgoraRtcKit/AgoraRtcEngineKit.h>


@interface LYModuleCall () <AgoraRtcEngineDelegate> {
	
	__strong AgoraRtcEngineKit *kit;
	
	__strong AgoraVideoEncoderConfiguration *conf;
	
	__strong LYCUInteger blockJoined;
	__strong LYCCompletion blockRemoteLeaved;
	
	__strong AgoraRtcVideoCanvas *remotecv;
}
@end

@implementation LYModuleCall

// MARK: - INIT

- (instancetype)init {
	if (self = [super init]) {
		
		NSString *appID = [LYModuleCallConfig config].agoraAppID;
		if (appID == nil || [appID isEmpty]) {
			NSLog(@"MODULE LYModuleCall ERROR - AGORA APP ID NOT DEFINED");
		}
		
		kit = [AgoraRtcEngineKit sharedEngineWithAppId:appID delegate:self];
		
		[kit enableVideo];
		
		conf = [[AgoraVideoEncoderConfiguration alloc] initWithSize:AgoraVideoDimension640x360 frameRate:AgoraVideoFrameRateFps15 bitrate:AgoraVideoBitrateStandard orientationMode:AgoraVideoOutputOrientationModeAdaptative];
		[kit setVideoEncoderConfiguration:conf];
	}
	return self;
}

+ (instancetype)module {
	static LYModuleCall *sharedModuleCall;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedModuleCall = [[LYModuleCall alloc] init];
	});
	
	return sharedModuleCall;
}

// MARK: - METHOD

- (void)joinChannel:(NSString *)ochannel byToken:(NSString *)token {
	
	[kit joinChannelByToken:token channelId:ochannel info:nil uid:0 joinSuccess:^(NSString *channel, NSUInteger uid, NSInteger elapsed) {
		NSLog(@"%@ %@ %@", channel, @(uid), @(elapsed));
	}];
}

- (void)setupLocalVideoView:(UIView *)localview andRemoteVideoView:(UIView *)remoteview {
	
	AgoraRtcVideoCanvas *localcanvas = [[AgoraRtcVideoCanvas alloc] init];
	localcanvas.uid = 0;
	localcanvas.renderMode = AgoraVideoRenderModeHidden;
	if (localview != nil) {
		localcanvas.view = localview;
	}
	[kit setupLocalVideo:localcanvas];
	
	AgoraRtcVideoCanvas *remotecanvas = [[AgoraRtcVideoCanvas alloc] init];
//	remotecanvas.uid // MARK: NEED UID
	remotecanvas.renderMode = AgoraVideoRenderModeHidden;
	if (remoteview != nil) {
		remotecanvas.view = remoteview;
	}
//	[kit setupRemoteVideo:remotecanvas];
	remotecv = remotecanvas;
	
}

- (void)leaveChannel {
	[kit leaveChannel:^(AgoraChannelStats *stat) {
		NSLog(@"%@", stat);
	}];
}

- (void)destroy {
	[AgoraRtcEngineKit destroy];
}

// MARK: EVENT

- (void)videoJoined:(void (^)(NSUInteger))respBlock {
	blockJoined = respBlock;
}

- (void)remoteLeaved:(void (^)(void))respBlock {
	blockRemoteLeaved = respBlock;
}

// MARK: - DELEGATE

// MARK: AgoraRtcEngineDelegate

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOccurError:(AgoraErrorCode)errorCode {
	NSLog(@"RTC ERROR %@", @(errorCode));
}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOccurWarning:(AgoraWarningCode)warningCode {
	NSLog(@"RTC WARNING %@", @(warningCode));
}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didJoinedOfUid:(NSUInteger)uid elapsed:(NSInteger)elapsed {
	
	remotecv.uid = uid;
	[kit setupRemoteVideo:remotecv];
	
	if (blockJoined != nil) {
		blockJoined(uid);
	} else {
		NSLog(@"BLOCK NOT FOUND");
	}
}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOfflineOfUid:(NSUInteger)uid reason:(AgoraUserOfflineReason)reason {
	
	remotecv.view = nil;
	
	if (blockRemoteLeaved != nil) {
		blockRemoteLeaved();
	} else {
		NSLog(@"BLOCK NOT FOUND");
	}
}

@end


// MARK: - LYModuleCallConfig

@implementation LYModuleCallConfig

+ (instancetype)config {
	static LYModuleCallConfig *sharedLYModuleCallConfig;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedLYModuleCallConfig = [[LYModuleCallConfig alloc] init];
	});
	return sharedLYModuleCallConfig;
}

@end
