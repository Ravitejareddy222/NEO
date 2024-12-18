//
//  TextFileldExtension.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "TextFieldExtension.h"

@implementation TextFieldExtension

+ (void)addLeftIconImageToTextField:(UITextField *)textField
                              image:(UIImage *)image
                    placeholderText:(NSString *)placeholderText {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 12, 18, 18)];
    leftImageView.image = image;
    leftImageView.tintColor = [UIColor whiteColor];
    [leftView addSubview:leftImageView];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftView;

    textField.layer.borderColor = [UIColor whiteColor].CGColor;
    textField.layer.borderWidth = 1.0;

    UIColor *hexColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    textField.textColor = hexColor;
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightMedium]
    };
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:attributes];
}

@end
