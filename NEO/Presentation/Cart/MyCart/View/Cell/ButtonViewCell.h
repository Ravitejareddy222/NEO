//
//  ButtonViewCell.h
//  NEO
//
//  Created by Neo on 14/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol  ButtonViewCellDelegate <NSObject>

-(void) orderBtnTapped;

@end

@interface ButtonViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *orderButton;
@property (strong, nonatomic) IBOutlet UILabel *totalCostLabel;
- (IBAction)orderButtonTapped:(id)sender;

-(void) configureForTotalCost: (NSNumber *)cost;
-(void) configureForOrderDetails: (NSNumber *)cost;

@property (nonatomic, weak) id<ButtonViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
