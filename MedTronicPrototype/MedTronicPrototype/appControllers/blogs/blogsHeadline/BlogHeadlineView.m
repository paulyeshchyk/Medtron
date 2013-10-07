//
//  BlogHeadlineView.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "BlogHeadlineView.h"
#import "DateFormatManager.h"
#import "UIImageUtils.h"

@interface BlogHeadlineView() {
    CALayer* imageViewMaskLayer_;
}
    @property (nonatomic, strong)IBOutlet UILabel* labelDate;
    @property (nonatomic, strong)IBOutlet UIImageView* imageView;
@end

@implementation BlogHeadlineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self applyLightning];
}

- (void)setCreatedDate:(NSDate*)createdDate {
    NSDateFormatter *formatter = [DateFormatManager formatterWithPattern:@"MMMM dd,yyyy"];
    self.labelDate.text = [formatter stringFromDate:createdDate];
}

- (void)setImageData:(NSData*)imageData {
    [self.imageView setImage:[UIImage imageWithData:imageData]];
    [self applyLightning];
}


- (void)applyLightning {
    if (imageViewMaskLayer_){
        [imageViewMaskLayer_ removeFromSuperlayer];
    }
    imageViewMaskLayer_ = [UIImageUtils lightningBottomLayerForBounds:self.imageView.bounds];
    self.imageView.layer.mask = imageViewMaskLayer_;
}

@end
