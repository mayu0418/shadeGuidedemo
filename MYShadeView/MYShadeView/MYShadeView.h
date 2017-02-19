//
//  MYShadeView.h
//  MYShadeView
//
//  Created by mayu on 2017/2/17.
//  Copyright © 2017年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYShadeGuideModel : NSObject

@property (nonatomic, strong) UIView *guideImageView;
@property (nonatomic, assign) CGRect clearRect;

@end

@interface MYShadeView : UIView

@property (nonatomic, copy) NSArray *shadeGuideModels;
@property (nonatomic, copy) void (^dismiss)();
- (void)shadeGuideShow;


@end
