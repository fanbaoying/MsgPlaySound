//
//  MsgPlaySound.h
//  MsgPlaySound
//
//  Created by cheBaidu on 2017/12/6.
//  Copyright © 2017年 车佰度. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface MsgPlaySound : NSObject
- (id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;
- (void)close;
- (void)play;
@end
