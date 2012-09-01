#import "DemoViewController.h"
#import "ALTreeTableView.h"
#import "ALTreeItemInfo.h"
#import "DemoViewCell.h"

@interface DemoTreeItem : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* children;
@end

@implementation DemoTreeItem {
@private
    NSString* _name;
    NSMutableArray* _children;
}

@synthesize name = _name;
@synthesize children = _children;

- (id)init {
    self = [super init];
    if (self) {
        _children = [[NSMutableArray alloc] init];
    }

    return self;
}

@end

@interface DemoViewController () <ALTreeTableViewDataSource>
@property (nonatomic, strong) NSArray* topItems;
@end

@implementation DemoViewController {
@private
    NSArray* _topItems;
}

@synthesize topItems = _topItems;


- (void)viewDidLoad {
    [super viewDidLoad];

    DemoTreeItem* work = [self generateItem:@"Work" parent:nil];
    DemoTreeItem* programming = [self generateItem:@"Programming" parent:work];
    DemoTreeItem* java = [self generateItem:@"Java" parent:programming];
    DemoTreeItem* javaScript = [self generateItem:@"JavaScript" parent:programming];
    DemoTreeItem* objectiveC = [self generateItem:@"ObjectiveC" parent:programming];
    DemoTreeItem* study = [self generateItem:@"Study" parent:nil];
    DemoTreeItem* math = [self generateItem:@"Mathematics" parent:study];
    DemoTreeItem* physics = [self generateItem:@"Physics" parent:study];
    self.topItems = [NSArray arrayWithObjects:work, study, nil];

    ALTreeTableView* treeTableView = [[ALTreeTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    treeTableView.treeDataSource = self;
    [treeTableView reloadTreeData];
    [self.view addSubview:treeTableView];
}

- (NSUInteger)treeTableView:(ALTreeTableView*)treeTableView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return [self.topItems count];
    }
    DemoTreeItem* treeItem = (DemoTreeItem* )item;
    return [treeItem.children count];
}

- (id)treeTableView:(ALTreeTableView*)treeTableView child:(NSUInteger)index1 ofItem:(id)item {
    if (item == nil) {
        return [self.topItems objectAtIndex:index1];
    }
    DemoTreeItem* treeItem = (DemoTreeItem* )item;
    return [treeItem.children objectAtIndex:index1];
}

- (UITableViewCell*)treeTableView:(ALTreeTableView*)treeTableView cellForItem:(id)item
                     treeItemInfo:(ALTreeItemInfo* )treeItemInfo{
    NSString* const identifier = @"CellIdentifier";
    DemoViewCell* cell = (DemoViewCell*)[treeTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DemoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.handler = ^(id o) {

        };
    }
    DemoTreeItem* treeItem = (DemoTreeItem* )item;
    cell.data = item;
    cell.textLabel.text = treeItem.name;
    return cell;
}

- (DemoTreeItem*)generateItem:(NSString*)name parent:(DemoTreeItem* )parentItem {
    DemoTreeItem* item = [[DemoTreeItem alloc] init];
    item.name = name;
    [parentItem.children addObject:item];
    return item;
}

@end