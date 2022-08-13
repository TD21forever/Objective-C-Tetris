//
//  UIColor+TT.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TT)

+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(NSString *)hex defaultHex:(NSString *)defaultHex;
+ (UIColor *)colorWithHex:(NSString *)hex defaultHex:(NSString *)defaultHex alpha:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END
