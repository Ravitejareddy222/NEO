//
//  AddreessViewCell.h
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

-(void) configure: (NSString *)address;

@end

NS_ASSUME_NONNULL_END
