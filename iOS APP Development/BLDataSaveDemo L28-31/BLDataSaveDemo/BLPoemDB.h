//
//  BLPoemDB.h
//  BLDataSaveDemo
//
//  Created by duansong on 15-7-14.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "BLPoem.h"

@interface BLPoemDB : NSObject {
    /**
     *  创建一个 FMDatabase 实例
     */
	FMDatabase		*_db;
}

/**
 *  创建一个表
 *
 *  @return 是否创建成功
 */
- (BOOL) createPoemTable;

/**
 *  增加一首诗到表
 *
 *  @param poem 待添加的诗
 *
 *  @return 是否添加成功
 */
- (BOOL) addPoem:(BLPoem *)poem;

/**
 *  查询所有诗
 *
 *  @return 查询到的包含所有诗的数组
 */
- (NSMutableArray *) getAllPoems;

/**
 *  查询被收藏的诗
 *
 *  @return 查询到的包含所有收藏的诗的数组
 */
- (NSMutableArray *) getFavoritesPoems;

/**
 *  更改是非收藏这一首诗
 *
 *  @param favorite 是否收藏
 *  @param poemId   待更改的诗的 ID
 *
 *  @return 是否更改收藏成功
 */
- (BOOL) setFavorite:(BOOL)favorite favoriteId:(NSInteger)poemId;

/**
 *  删除指定 ID 的一首诗
 *
 *  @param poemId 待删除的诗的 ID
 *
 *  @return  是否删除成功
 */
- (BOOL) deletePoemWithPoemId:(NSInteger)poemId;

@end
