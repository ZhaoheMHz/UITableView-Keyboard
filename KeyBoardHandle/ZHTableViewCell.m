//
//  ZHTableViewCell.m
//  KeyBoardHandle
//
//  Created by 赵赤赤 on 16/5/31.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ZHTableViewCell.h"

@implementation ZHTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建UI
        [self createUI];
    }
    
    return self;
}

/** 创建UI */
- (void)createUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    self.tf.placeholder = @"我是输入框";
    [self.contentView addSubview:self.tf];
}

@end
