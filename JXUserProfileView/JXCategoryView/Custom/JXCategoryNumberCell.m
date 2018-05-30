//
//  JXCategoryNumberCell.m
//  DQGuess
//
//  Created by jiaxin on 2018/4/9.
//  Copyright © 2018年 jingbo. All rights reserved.
//

#import "JXCategoryNumberCell.h"
#import "JXCategoryNumberCellModel.h"

@interface JXCategoryNumberCell ()
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) NSLayoutConstraint *numberLabelWidthLayout;
@end

@implementation JXCategoryNumberCell

- (void)initializeViews {
    [super initializeViews];
    
    UILabel *label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor colorWithRed:213/255.0 green:55/255.0 blue:77/255.0 alpha:1];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 7;
        label.layer.masksToBounds = YES;
        label;
    });
    [self.contentView addSubview:label];
    self.numberLabel = label;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:14];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:14];
    self.numberLabelWidthLayout = width;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:3];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:-3];
    [self.contentView addConstraints:@[width, height, top, leading]];
}

- (void)reloadDatas:(JXCategoryBaseCellModel *)cellModel {
    [super reloadDatas:cellModel];

    JXCategoryNumberCellModel *myCellModel = (JXCategoryNumberCellModel *)cellModel;
    self.numberLabel.hidden = myCellModel.count == 0;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)myCellModel.count];
    if (myCellModel.count < 10) {
        self.numberLabelWidthLayout.constant = 14;
    }else if (myCellModel.count >= 10 && myCellModel.count <= 99) {
        self.numberLabelWidthLayout.constant = 20;
    }else if (myCellModel.count >= 100 && myCellModel.count <= 999) {
        self.numberLabelWidthLayout.constant = 29;
    }else if (myCellModel.count >= 1000) {
        self.numberLabel.text = @"999+";
        self.numberLabelWidthLayout.constant = 38;
    }
}

@end
