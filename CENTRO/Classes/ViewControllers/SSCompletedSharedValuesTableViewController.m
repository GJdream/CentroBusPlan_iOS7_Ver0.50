//
//  SSCompletedSharedValuesTableViewController.m
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import "SSCompletedSharedValuesTableViewController.h"
#import "SSUser.h"

@interface SSCompletedSharedValuesTableViewController () <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *_fetchedResultsController;
}
- (void)refetchData;

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation SSCompletedSharedValuesTableViewController


- (void)refetchData {
    _fetchedResultsController.fetchRequest.resultType = NSManagedObjectResultType;
    [_fetchedResultsController performFetch:nil];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (IBAction)tryAgainButtonPressed:(id)sender {
    UIStoryboard *profileStoryBoard = [UIStoryboard storyboardWithName: @"shared_values" bundle:Nil];
    UIViewController *initProfileView = [profileStoryBoard instantiateInitialViewController];
    initProfileView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    
    [self.navigationController pushViewController:initProfileView animated:YES];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backgroundImageView40 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-568h@2x.png"]];
    UIImageView *backgroundImageView35R = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        self.tableView.backgroundView = backgroundImageView40;
    } else {
        self.tableView.backgroundView = backgroundImageView35R;
    }
    self.tableView.backgroundView.contentMode = UIViewContentModeCenter;
    
    self.navigationItem.title = @"Shared Values";
    
    self.tryAgainButton.title = @"Try Again!";
    
    self.context = [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Value"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"selectedAsCompanyValue = 1"]];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"companyRank" ascending:YES selector:nil]];
    fetchRequest.returnsObjectsAsFaults = NO;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    [_fetchedResultsController performFetch:nil];
    

}

-(void) viewWillAppear:(BOOL)animate {
    [super viewWillAppear:animate];
    
    if(![[SSUser currentUser] isLoggedIn]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SharedValuesCompleted";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    NSManagedObject *managedObject = [_fetchedResultsController objectAtIndexPath:indexPath];
    
    NSString *pos = [managedObject valueForKey:@"rank"];
    NSString *value = [managedObject valueForKey:@"valueLiteralUS"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@. %@", pos, value];
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

-(void) dealloc {
    _fetchedResultsController = nil;
    self.context = nil;
}
@end