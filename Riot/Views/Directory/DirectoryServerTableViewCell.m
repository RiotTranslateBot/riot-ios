/*
 Copyright 2017 Vector Creations Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "DirectoryServerTableViewCell.h"

#import "AvatarGenerator.h"
#import "RiotDesignValues.h"

@implementation DirectoryServerTableViewCell

#pragma mark - Class methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.descLabel.textColor = kRiotTextColorBlack;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Round image view
    self.iconImageView.clipsToBounds = YES;
    self.iconImageView.backgroundColor = [UIColor clearColor];
}

- (void)render:(id<MXKDirectoryServerCellDataStoring>)cellData
{
    self.iconImageView.hidden = NO;

    if (cellData.icon)
    {
        self.iconImageView.image = cellData.icon;
    }
    else  if (cellData.thirdPartyProtocolInstance.icon)
    {
        [self.iconImageView setImageURL:cellData.thirdPartyProtocolInstance.icon withType:nil andImageOrientation:UIImageOrientationUp previewImage:[UIImage imageNamed:@"placeholder"]];
    }
    else
    {
        self.iconImageView.hidden = YES;
    }

    self.descLabel.text = cellData.desc;
}

+ (CGFloat)cellHeight
{
    return 74;
}

@end
