//
//  TextFileldExtension.h
//  NEO
//
//  Created by Neo on 06/12/24.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldExtension : UITextField

@property (strong, nonatomic) NSString *placeholderText;
@property (strong, nonatomic)  UIImage *leftIcon;

+ (void)addLeftIconImageToTextField:(UITextField *)textField
                              image:(UIImage *)image
                    placeholderText:(NSString *)placeholderText;


@end

NS_ASSUME_NONNULL_END

