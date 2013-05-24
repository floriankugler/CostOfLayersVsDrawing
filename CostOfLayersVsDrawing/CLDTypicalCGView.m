//
// Created by Florian on 23.05.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <CoreGraphics/CoreGraphics.h>
#import "CLDTypicalCGView.h"


@implementation CLDTypicalCGView {

}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    #ifdef GRADIENT_AS_IMAGE

    [[UIImage imageNamed:@"gradient.png"] drawAtPoint:CGPointZero];

    #else

    UIColor* startColor = [UIColor lightGrayColor];
    UIColor* endColor = [UIColor whiteColor];
    CGColorRef colorRef[] = { startColor.CGColor, endColor.CGColor };
    CFArrayRef colors = CFArrayCreate(NULL, (const void**)colorRef, sizeof(colorRef) / sizeof(CGColorRef), &kCFTypeArrayCallBacks);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colors, NULL);
    CFRelease(colorSpace);
    CFRelease(colors);

    CGPoint start = CGPointMake(0, 0);
    CGPoint end = CGPointMake(0, self.bounds.size.height);

    CGContextDrawLinearGradient(ctx, gradient, start, end, 0);
    CFRelease(gradient);

    #endif

    [[UIImage imageNamed:@"lucy.jpg"] drawAtPoint:CGPointZero];

    UIFont* font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    [@"Test Label 1" drawInRect:CGRectMake(110, 0, self.bounds.size.width - 110, 20) withFont:font];
    [@"Test Label 2" drawInRect:CGRectMake(110, 30, self.bounds.size.width - 110, 20) withFont:font];
}


@end