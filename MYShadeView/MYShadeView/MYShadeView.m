//
//  MYShadeView.m
//  MYShadeView
//
//  Created by mayu on 2017/2/17.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "MYShadeView.h"

@implementation MYShadeGuideModel

@end

@interface MYShadeView ()

@property (nonatomic, assign) NSUInteger currentPage;

@end

@implementation MYShadeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        _currentPage = 0;
        self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.currentPage < self.shadeGuideModels.count - 1) {
        self.currentPage += 1;
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self createGuideContentRoundedBox];
    } else {
        [self disMiss];
    }
}


- (void)disMiss {
    self.alpha = 1;
    [UIView animateWithDuration:1.f
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self removeFromSuperview];
                             if (self.dismiss) {
                                 self.dismiss();
                             }
                         }
                     }];
}

- (void)shadeGuideShow {
    if (self.shadeGuideModels.count > 0) {

        [self createGuideContentRoundedBox];
        [[UIApplication sharedApplication].keyWindow addSubview:self];

    }
}

- (void)createGuideContentRoundedBox {
    
    MYShadeGuideModel *model = self.shadeGuideModels[self.currentPage];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:model.clearRect cornerRadius:4] bezierPathByReversingPath]];
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    [self addSubview:model.guideImageView];

}

@end
