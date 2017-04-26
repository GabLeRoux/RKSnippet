#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface RKSnippetViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_snippets;
}

@property (strong, nonatomic) IBOutlet UITableView *_tableView;

@end
