//
//  UIViewController+Title.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Title)

- (void)setCustomTitle:(NSString *)title;

-(void) showAlert: (NSString *)title mesaage: (NSString *)message;

@end

NS_ASSUME_NONNULL_END
