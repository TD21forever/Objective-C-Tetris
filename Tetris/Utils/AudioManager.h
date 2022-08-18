//
//  AudioManager.h
//  Tetris
//
//  Created by T D on 2022/8/18.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Constant.h"
NS_ASSUME_NONNULL_BEGIN

@interface AudioManager : NSObject

+ (instancetype)shared;
- (AVAudioPlayer*)getPlayerByName:(NSString*)name;
- (void)performAutioWithType:(ButtonAudioType)type;

@end

NS_ASSUME_NONNULL_END
