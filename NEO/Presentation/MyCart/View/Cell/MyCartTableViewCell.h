//
//  MyCartTableViewCell.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>
#import "MyCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCartTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productCategory;
@property (strong, nonatomic) IBOutlet UITextField *quantityTextField;

-(void) configure: (MyCartData *)data;

@end

NS_ASSUME_NONNULL_END
