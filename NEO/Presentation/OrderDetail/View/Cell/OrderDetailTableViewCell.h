//
//  OrderDetailTableViewCell.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>
#import "OrderDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *prodImage;
@property (strong, nonatomic) IBOutlet UILabel *prodName;
@property (strong, nonatomic) IBOutlet UILabel *prodCategory;
@property (strong, nonatomic) IBOutlet UILabel *cost;
@property (strong, nonatomic) IBOutlet UILabel *quantity;
-(void) configure: (ItemDetails *)data;
@end

NS_ASSUME_NONNULL_END
