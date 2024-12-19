//
//  MyCartTableViewCell.h
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import <UIKit/UIKit.h>
#import "MyCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MyCartTableViewCellDelegate <NSObject>
- (void)didQuantityChange:(NSInteger)quantity atIndex:(NSInteger)index;
@end

@interface MyCartTableViewCell : UITableViewCell<UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productCategory;
@property (strong, nonatomic) IBOutlet UITextField *quantityTextField;

@property (nonatomic, strong) UIPickerView *numberPicker;
@property (nonatomic, strong) NSArray<NSNumber *> *quantity;

@property (nonatomic, assign) NSInteger indexPath;

@property (nonatomic, weak) id<MyCartTableViewCellDelegate> delegate;


-(void) configure: (MyCartData *)data;
- (void)setUpView;
- (void)pickerSetUp;

@end

NS_ASSUME_NONNULL_END
