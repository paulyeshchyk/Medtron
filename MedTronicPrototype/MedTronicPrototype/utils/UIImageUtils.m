//
//  UIImageUtils.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UIImageUtils.h"

@implementation UIImageUtils

+ (CALayer*)lightningBottomLayerForBounds:(CGRect)bounds {
    UIColor *outerColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    UIColor *innerColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.endPoint = CGPointMake(0.5f, 0.0f);
    layer.startPoint = CGPointMake(0.5f, 1.0f);
    layer.frame = bounds;
    layer.colors = @[(id)outerColor.CGColor, (id)outerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor];
    layer.locations = @[@0.10, @0.20, @0.30, @0.40f];
    return layer;
}

+ (UIImage *)image:(UIImage*)image tintedWithLinearGradientColors:(NSArray *)colorsArr scale:(CGFloat)scale size:(CGSize)size{
    UIGraphicsBeginImageContext(CGSizeMake(size.width * scale, size.height * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, size.width * scale, size.height * scale);
    CGContextDrawImage(context, rect, image.CGImage);
    
    // Create gradient
    
    UIColor *colorOne = [colorsArr objectAtIndex:1]; // top color
    UIColor *colorTwo = [colorsArr objectAtIndex:0]; // bottom color
    
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
    // Apply gradient
    
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,size.height * scale), 0);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return gradientImage;
}


+ (UIImage *)image:(UIImage*)image clearRect:(CGRect)rect{
    
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions([image size], NO, 0.0);
    else
        UIGraphicsBeginImageContext([image size]);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [image drawInRect:CGRectMake(0.0, 0.0, [image size].width, [image size].height)];
    CGContextClearRect(context, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (UIImage*)image:(UIImage*)image clipWithRadius:(CGFloat)r {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [[UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointZero, image.size}
                                cornerRadius:r] addClip];
    [image drawInRect:(CGRect){CGPointZero, image.size}];
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage*)image:(UIImage*)image clipWithTransparentRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(ctx, kCGBlendModeDifference);
    CGContextBeginTransparencyLayer(ctx, NULL);
    {
        CGContextSetFillColor(ctx, CGColorGetComponents([UIColor redColor].CGColor));
        
        CGContextAddPath(ctx, [UIBezierPath bezierPathWithRect:CGRectMake(0,100,image.size.width,image.size.height)].CGPath);
        CGContextFillPath(ctx);
        // the above two lines could instead be CGContextDrawImage()
        // or whatever else you're using to clear
    }
    CGContextEndTransparencyLayer(ctx);
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}



+ (CALayer*)gradientLayerWithColors:(UIColor *)color {
    
//    [ownerLayer.sublayers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        *stop = ([obj isKindOfClass:[CAGradientLayer class]]);
//        if (*stop){
//            [((CAGradientLayer*)obj) removeFromSuperlayer];
//        }
//    }];
//    
    CAGradientLayer *layer = [CAGradientLayer layer];
    
    layer.colors = [NSArray arrayWithObjects:
                    (id)[color CGColor],
                    (id)[[UIColor colorWithRed:1.0f
                                         green:1.0f
                                          blue:1.0f
                                         alpha:1.0f] CGColor],
                    nil];
    
    layer.locations = [NSArray arrayWithObjects:
                       [NSNumber numberWithFloat:0.0f],
                       [NSNumber numberWithFloat:0.5f],
                       nil];
    
    return layer;
//    layer.frame = ownerLayer.bounds;
}



@end
