//
//  UIColor+TT.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "UIColor+TT.h"

@implementation UIColor (TT)

+ (UIColor *)colorWithHex:(NSString *)hex defaultHex:(NSString *)defaultHex
{
    return [UIColor colorWithHex:hex defaultHex:defaultHex alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSString *)hex defaultHex:(NSString *)defaultHex alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor colorWithHex:hex alpha:alpha];
    if (color == [UIColor clearColor]) {
        return [UIColor colorWithHex:defaultHex alpha:alpha];
    } else return color;
}

+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha
{
    NSString *hexString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([hexString length] < 6) {
        return [UIColor clearColor];
    }
    if ([hexString hasPrefix:@"0X"]) {
        hexString = [hexString substringFromIndex:2];
    }
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    if ([hexString length] != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [hexString substringWithRange:range];
    range.location = 2;
    NSString *gString = [hexString substringWithRange:range];
    range.location = 4;
    NSString *bString = [hexString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0f green:(float)g / 255.0f blue:(float)b / 255.0f alpha:alpha];
}

+ (UIColor *)colorWithHex:(NSString *)hex
{
    return [self colorWithHex:hex alpha:1.0];
}

@end
