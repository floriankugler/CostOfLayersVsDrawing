//
// Created by Florian on 23.05.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "CLDTypicalLayerView.h"


@implementation CLDTypicalLayerView {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    #ifdef GRADIENT_AS_IMAGE
    CALayer* gradientLayer = [[CALayer alloc] init];
    gradientLayer.contents = (__bridge id) [UIImage imageNamed:@"gradient.png"].CGImage;
    #else
    CAGradientLayer* gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.colors = @[(__bridge id)[UIColor lightGrayColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    #endif
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];

    CALayer* imageLayer = [[CALayer alloc] init];
    imageLayer.frame = CGRectMake(0, 0, 100, 100);
    imageLayer.contents = (__bridge id)[UIImage imageNamed:@"lucy.jpg"].CGImage;
    [self.layer addSublayer:imageLayer];

    CATextLayer* label1 = [[CATextLayer alloc] init];
    label1.fontSize = [UIFont systemFontSize];
    label1.foregroundColor = [UIColor blackColor].CGColor;
    label1.frame = CGRectMake(110, 0, self.bounds.size.width - 110, 20);
    label1.string = @"Test Label 1";
    [self.layer addSublayer:label1];

    CATextLayer* label2 = [[CATextLayer alloc] init];
    label2.fontSize = [UIFont systemFontSize];
    label2.foregroundColor = [UIColor blackColor].CGColor;
    label2.frame = CGRectMake(110, 30, self.bounds.size.width - 110, 20);
    label2.string = @"Test Label 2";
    [self.layer addSublayer:label2];
}


@end