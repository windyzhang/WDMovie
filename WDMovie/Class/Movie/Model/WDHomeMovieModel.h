//
//  WDHomeMovieModel.h
//  WDMovie
//
//  Created by WindyZhang on 16/10/13.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface WDHomeMovieModel : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *jumpType;
@property(nonatomic,copy)NSString *subjectId;
@property(nonatomic,copy)NSString *picUrl;
@property(nonatomic,copy)NSString *playUrl;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *videoId;
@property(nonatomic,copy)NSString *hotDegree;
@property(nonatomic,copy)NSString *hotType;
@property(nonatomic,copy)NSString *playTimeIconUrl;
@property(nonatomic,copy)NSString *webUrl;
@property(nonatomic,copy)NSString *splitItem;
@property(nonatomic,copy)NSString *canShare;
@property(nonatomic,copy)NSString *ext;
@property(nonatomic,copy)NSString *libId;
@property(nonatomic,copy)NSString *channelId;
@property(nonatomic,copy)NSString *jumpChannel;
@property(nonatomic,copy)NSString *osType;
@property(nonatomic,copy)NSString *activityId;
@property(nonatomic,copy)NSString *cid;
@property(nonatomic,copy)NSString *rootId;
@property(nonatomic,copy)NSString *isFormal;
@property(nonatomic,copy)NSString *ended;
@property(nonatomic,copy)NSArray *updateList;

@end

@interface WDHomeMovieListModel : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy)NSString *type;//banner,textRollLink,title,normalLandScape,largeLandScapeNodesc,textMoreLink
@property(nonatomic,copy)NSArray *templateData;

@end
