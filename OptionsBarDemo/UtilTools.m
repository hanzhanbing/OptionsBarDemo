//
//  UtilTools.m
//  xiaoyixiu
//
//  Created by 赵岩 on 16/6/14.
//  Copyright © 2016年 柯南. All rights reserved.
//

#import "UtilTools.h"

@implementation UtilTools
static SystemSoundID shake_sound_enter_id = 0;

#pragma mark   判空方法

+ (BOOL)isBlankString:(id)string
{
    string = [NSString stringWithFormat:@"%@",string];
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if([string isEqualToString:@"<null>"])
    {
        return YES;
    }
    if ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isBlankArray:(NSArray *)array
{
    if (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
    {
        return YES;
    }
    return NO;
}

+(BOOL)isBlankDictionary:(NSDictionary *)dictionary;
{
    if (dictionary == nil || [dictionary isKindOfClass:[NSNull class]] || dictionary.count == 0)
    {
        return YES;
    }
    return NO;
}

//身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//密码
+(BOOL)password:(NSString *)password
{
    NSString * regex = @"^[A-Za-z0-9]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

//计算文本高度
+ (CGSize)getTextHeight:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return textRect.size;
}
//计算文本宽度
+ (CGSize)getTextHeight:(NSString *)text hight:(CGFloat)hight font:(UIFont *)font
{
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, hight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return textRect.size;
}
//计算textView的高度
+ (CGFloat)getTextViewHeight:(NSString *)text font:(UIFont*)font width:(CGFloat)width;
{
    //初始化textView
    UITextView *textView = [[UITextView alloc] init];
    [textView setText:text];
    [textView setFont:font];
    
    CGSize size = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return size.height;
}

//打电话
+ (UIWebView *)call:(NSString *)phoneAccount
{
    NSString *callPhone = phoneAccount;
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",callPhone]];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
    return  callWebView;
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
