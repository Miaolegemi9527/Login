//
//  ListTableViewCell.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/16.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createThisPageUI];
    }
    return self;
}
-(void)createThisPageUI
{
    self.bgImageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.bgImageV];
    
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageV];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.detailsLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.detailsLabel];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImageV.frame = CGRectMake(5, 0, 365, 50);
    self.bgImageV.layer.borderColor = [UIColor orangeColor].CGColor;
    self.bgImageV.layer.borderWidth = 1;
    
    self.imageV.frame = CGRectMake(10, 5, 48, 48);
    self.imageV.layer.cornerRadius = 24;
    self.imageV.layer.masksToBounds = YES;
    self.imageV.image = [UIImage imageNamed:@"touxiang1"];
    
    self.nameLabel.frame = CGRectMake(68, 5, 300, 16);
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.text = @"呵呵哒";
    
    self.detailsLabel.frame = CGRectMake(68, 32, 300, 12);
    self.detailsLabel.font = [UIFont systemFontOfSize:12];
    self.detailsLabel.text = @"忽如一夜春风来，千树万树梨花开";
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
