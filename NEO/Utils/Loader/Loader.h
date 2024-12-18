//
//  Loader.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject
+ (void)setUpLoaderInView:(UIView *)view;
+ (void)showLoaderInView:(UIView *)view;
+ (void)hideLoaderInView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
