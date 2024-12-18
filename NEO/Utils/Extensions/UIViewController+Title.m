//
//  UIViewController+Title.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "UIViewController+Title.h"

@implementation UIViewController (Title)
- (void)setCustomTitle:(NSString *)title {
    CGFloat fontSize = 23.0;
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    NSDictionary *textAttributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSFontAttributeName: font
    };

    if (self.navigationController) {
        self.navigationController.navigationBar.titleTextAttributes = textAttributes;
        self.title = title;
    } else {
        NSLog(@"Warning: This view controller is not embedded in a navigation controller.");
    }
}

-(void) showAlert: (NSString *)title mesaage: (NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
