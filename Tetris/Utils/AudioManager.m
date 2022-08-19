//
//  AudioManager.m
//  Tetris
//
//  Created by T D on 2022/8/18.
//

#import "AudioManager.h"

@interface AudioManager()

@end

@implementation AudioManager
    
static NSMutableDictionary* _cache;
    
+ (instancetype)shared{
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[self alloc]init];
        _cache = [[NSMutableDictionary alloc]init];
    });
    return _shared;
}
- (void)performAudioWithType:(ButtonAudioType)type{
    NSString* name;
    switch (type) {
        case ButtonAudioDirection:
            name = @"direction";
            break;
        case ButtonAudioRemove:
            name = @"remove";
            break;
        case ButtonAudioAction:
            name = @"action";
            break;
        case ButtonAudioReverse:
            name = @"rotation";
            break;
        case ButtonAudioOver:
            name = @"over";
            break;
        default:
            break;
    }
    AVAudioPlayer* player;

    if(![_cache objectForKey:name]){
        player = [[AudioManager shared]getPlayerByName:name];
        [_cache setValue:player forKey:name];
    }
    
    player = [_cache objectForKey:name];
    player.currentTime = 0;
    [player play];
}


- (AVAudioPlayer*)getPlayerByName:(NSString*)name{
    NSBundle * bundel = [NSBundle mainBundle];
    NSString * path = [bundel pathForResource:name ofType:@"mp3"];
    NSData * data = [[NSData alloc]initWithContentsOfFile:path];
    AVAudioPlayer * player = [[AVAudioPlayer alloc]initWithData:data error:nil];
    player.volume        = 1.0;
    player.pan           = 0;
    player.numberOfLoops = 0;
    player.currentTime   = 0.0;
    [player prepareToPlay];
    return player;
}

@end
