//
// Created by Florian on 23.05.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import "CLDTypicalNaiveView.h"


@implementation CLDTypicalNaiveView {

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
    UIImageView* gradientView = [[UIImageView alloc] initWithFrame:self.bounds];
    gradientView.image = [UIImage imageNamed:@"gradient.png"];
    #else
    UIView* gradientView = [[UIView alloc] initWithFrame:self.bounds];
    CAGradientLayer* gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor lightGrayColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    [gradientView.layer addSublayer:gradientLayer];
    #endif
    [self addSubview:gradientView];

    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.image = [UIImage imageNamed:@"lucy.jpg"];
    [self addSubview:imageView];

    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, self.bounds.size.width - 110, 20)];
    label1.text = @"Test Label 1";
    label1.backgroundColor = [UIColor clearColor];
    [self addSubview:label1];

    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(110, 30, self.bounds.size.width - 110, 20)];
    label2.text = @"Test Label 2";
    label2.backgroundColor = [UIColor clearColor];
    [self addSubview:label2];
}


@end