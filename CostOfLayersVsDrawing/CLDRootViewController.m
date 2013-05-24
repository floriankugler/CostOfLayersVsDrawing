//
// Created by Florian on 18.05.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CLDRootViewController.h"
#import "CLDTypicalNaiveView.h"
#import "CLDTypicalLayerView.h"
#import "CLDTypicalCGView.h"
#import <QuartzCore/QuartzCore.h>


@implementation CLDRootViewController {
    UIView* containerView;
    CFTimeInterval previousTimestamp;
    int frameCounter;
    float displayTime;
    NSUInteger numberOfViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startProfiling];
}

- (void)startProfiling {
    displayTime = 0;
    frameCounter = 0;
    numberOfViews = 5;
    [self recreateViews];
    #ifdef VIEW_CREATION
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(nextCreateFrame:)];
    #else
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(nextAnimationFrame:)];
    #endif
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)nextCreateFrame:(CADisplayLink*)displayLink {
    if (frameCounter > 0) {
        displayTime += (displayLink.timestamp - previousTimestamp);
    }
    frameCounter++;
    if (frameCounter > 60) {
        NSLog(@"%d - %f", numberOfViews, displayTime / 60);
        numberOfViews += 5;
        displayTime = 0;
        frameCounter = 0;
    }
    [self recreateViews];
    previousTimestamp = displayLink.timestamp;
}

- (void)nextAnimationFrame:(CADisplayLink*)displayLink {
    containerView.transform = CGAffineTransformMakeTranslation(self.randomNumber * 50 - 25, self.randomNumber * 50 - 25);
}

- (CGFloat)randomNumber {
    return (arc4random() % 1000) / 1000.0;
}


- (void)recreateViews {
    [containerView removeFromSuperview];
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];

    for (NSUInteger i = 0; i < numberOfViews; i++) {
        CGRect frame = CGRectMake(0, self.randomNumber * containerView.bounds.size.height, containerView.bounds.size.width, 100);
//        UIView* subview = [[CLDTypicalNaiveView alloc] initWithFrame:frame];
//        UIView* subview = [[CLDTypicalLayerView alloc] initWithFrame:frame];
        UIView* subview = [[CLDTypicalCGView alloc] initWithFrame:frame];
        [containerView addSubview:subview];
    }

    [self.view addSubview:containerView];
}

@end