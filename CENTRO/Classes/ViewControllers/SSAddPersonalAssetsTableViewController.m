//
//  SSAddPersonalAssetsTableViewController.m
//  CENTRO
//
//  Created by Centro Community Partners.
//  Copyright (c) 2013 Centro Community Partners. All rights reserved.
//

#import "SSAddPersonalAssetsTableViewController.h"
#import "SSAddEditPersonalAssetsViewController.h"
#import "SSUser.h"
#import "StudentAsset.h"

@interface SSAddPersonalAssetsTableViewController () <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *_fetchedResultsController;
}
- (void)refetchData;

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation SSAddPersonalAssetsTableViewController

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
    
    self.tableView.delegate = self;
    
    self.navigationItem.title = @"List of Assets";
    
    self.context = [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddPersonalAssetDetail"]) {
        SSAddEditPersonalAssetsViewController *addEditPersonalAssetsViewController = (SSAddEditPersonalAssetsViewController *) segue.destinationViewController;
        
        StudentAsset *sa = (StudentAsset *) [_fetchedResultsController objectAtIndexPath:self.selectedIndexPath];
        
        [addEditPersonalAssetsViewController setStudentAsset:sa];
        [addEditPersonalAssetsViewController setEditingExistingAsset:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if(![[SSUser currentUser] isLoggedIn]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"StudentAsset"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"selectedAsAsset = 0"]];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"studentAssetID" ascending:YES selector:nil]];
    fetchRequest.returnsObjectsAsFaults = NO;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    [_fetchedResultsController performFetch:nil];
    
    
    [self.tableView reloadData];
    [self.tableView setEditing:NO animated:YES];
    
    self.selectedIndexPath = nil;
    
    if([[[_fetchedResultsController sections] objectAtIndex:0] numberOfObjects] == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
    static NSString *CellIdentifier = @"AddPersonalAssetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    NSManagedObject *managedObject = [_fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [managedObject valueForKey:@"studentAssetLiteralUS"];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    self.selectedIndexPath = indexPath;
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    [self performSegueWithIdentifier:@"AddPersonalAssetDetail" sender:self];

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}


@end
