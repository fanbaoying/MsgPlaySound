//
//  ViewController.m
//  MsgPlaySound
//
//  Created by cheBaidu on 2017/12/6.
//  Copyright © 2017年 车佰度. All rights reserved.
//

#import "ViewController.h"
#import "MsgPlaySound.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MsgPlaySound *sound = [[MsgPlaySound alloc]initSystemShake];
//    [sound play];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   MsgPlaySound *soundone = [[MsgPlaySound alloc]initSystemSoundWithName:@"" SoundType:@""];
    [soundone play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
