//
//  HomeViewController.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray<NSString *> *categoryList;

@end

NS_ASSUME_NONNULL_END
