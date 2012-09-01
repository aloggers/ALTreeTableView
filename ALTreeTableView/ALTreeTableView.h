#import <UIKit/UIKit.h>

@class ALTreeTableView;
@class ALTreeItemInfo;

@protocol ALTreeTableViewDataSource
- (NSUInteger)treeTableView:(ALTreeTableView* )treeTableView numberOfChildrenOfItem:(id)item;
- (id)treeTableView:(ALTreeTableView* )treeTableView child:(NSUInteger)index ofItem:(id)item;
- (UITableViewCell* )treeTableView:(ALTreeTableView* )treeTableView cellForItem:(id)item
                      treeItemInfo:(ALTreeItemInfo* )treeItemInfo;
@end

@interface ALTreeTableView : UITableView
@property (nonatomic, weak) id<ALTreeTableViewDataSource> treeDataSource;
- (void)reloadTreeData;
@end