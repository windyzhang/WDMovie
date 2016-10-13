//
//  WDHomeMovieModel.m
//  WDMovie
//
//  Created by WindyZhang on 16/10/13.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDHomeMovieModel.h"

@implementation WDHomeMovieModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{ @"name" : @"name",
              @"jumpType" : @"jumpType",
              @"subjectId" : @"subjectId",
              @"picUrl": @"picUrl",
              @"playUrl" : @"playUrl",
              @"icon" : @"icon",
              @"tag" : @"tag",
              @"desc" : @"desc",
              @"videoId" : @"videoId",
              @"hotDegree" : @"hotDegree",
              @"hotType" : @"hotType",
              @"playTimeIconUrl" : @"playTimeIconUrl",
              @"webUrl" : @"webUrl",
              @"splitItem" : @"splitItem",
              @"canShare" : @"canShare",
              @"ext" : @"ext",
              @"libId" : @"libId",
              @"channelId" : @"channelId",
              @"jumpChannel" : @"jumpChannel",
              @"osType" : @"osType",
              @"activityId" : @"activityId",
              @"cid" : @"cid",
              @"rootId" : @"rootId",
              @"isFormal" : @"isFormal",
              @"ended" : @"ended",
              @"updateList" : @"updateList"
              };
}

@end

@implementation WDHomeMovieListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{ @"type" : @"data.type",
              @"templateData" : @"data.templateData",
              };
}

+ (NSValueTransformer *)templateDataJSONTransformer {
    return [NSValueTransformer
            mtl_JSONArrayTransformerWithModelClass:[WDHomeMovieModel class]];
}


@end
