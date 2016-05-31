//
//  ViewController.m
//  KeyBoardHandle
//
//  Created by 赵赤赤 on 16/5/31.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "ZHTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController {
    NSIndexPath *_indexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[ZHTableViewCell class] forCellReuseIdentifier:@"ZHTableViewCell"];
    
    [self registerForKeyboardNotifications];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kbSize.height, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0);
    
    // 跳转到当前点击的输入框所在的cell
    [self.tableView scrollToRowAtIndexPath:_indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {

    self.tableView.contentInset = UIEdgeInsetsZero;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHTableViewCell" forIndexPath:indexPath];

    cell.tf.delegate = self;
    
    return cell;
}


#pragma mark - textfield代理
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)textField.superview.superview];
    _indexPath = indexPath;
}


@end
