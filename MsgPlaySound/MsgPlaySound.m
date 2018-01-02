//
//  MsgPlaySound.m
//  MsgPlaySound
//
//  Created by cheBaidu on 2017/12/6.
//  Copyright © 2017年 车佰度. All rights reserved.
//

#import "MsgPlaySound.h"
@interface MsgPlaySound ()
{
    SystemSoundID sound;
}
//振动计时器
@property (nonatomic,strong)NSTimer *vibrationTimer;
@end
@implementation MsgPlaySound

- (id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:soundType];
        if (path) {
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &sound);
           AudioServicesAddSystemSoundCompletion(sound, NULL, NULL, soundCompleteCallback, NULL);
        } else {
            NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",@"sms-received1",@"caf"];
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&sound);
            AudioServicesAddSystemSoundCompletion(sound, NULL, NULL, soundCompleteCallback, NULL);
            if (error != kAudioServicesNoError) {//获取的声音的时候，出现错误
                sound = nil;
            }
        }
    
        /**
         初始化计时器  每一秒振动一次
         @param playkSystemSound 振动方法
         @return
         */
        self.vibrationTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(playkSystemSound) userInfo:nil repeats:YES];
    }
    return self;
}
- (void)playkSystemSound{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
- (void)play
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSound(sound);
}
- (void)close
{
    [_vibrationTimer invalidate];
    _vibrationTimer = nil;
    AudioServicesRemoveSystemSoundCompletion(sound);
    AudioServicesDisposeSystemSoundID(sound);
}
//响铃回调方法
void soundCompleteCallback(SystemSoundID sound,void * clientData) {
    AudioServicesPlaySystemSound(sound);
}
@end
