#ifndef __TIEBA_BI__
#define __TIEBA_BI__
#include "../inc/CLionetHttp.bi"
#define TODO: rem
'
'namespace CTieba
'
' {Basic structures}:
'   class CTiebaSubPost
'   class CTiebaPost
'   class CTiebaThread
'   class CTiebaBar
'   class CTiebaUser
'
' {HTTP core}:
'   class CTiebaHttp
'
' {First Person structure}:
'   class CTiebaMe
'
namespace CTieba
    
    '//Pseudo structures
    type ctiebame_f as CTiebaMe
    type ctiebasubpost_f as CTiebaSubPost
    type ctiebapost_f as CTiebaPost
    type ctiebathread_f as CTiebaThread
    type ctiebabar_f as CTiebaBar
    type ctiebauser_f as CTiebaUser
    type ctiebagoodclassify_f as CTiebaGoodClassify
    
    '////////////////////
    type CTiebaGoodClassify
        as string id, name
        as ctiebame_f ptr me
    end type
    
    type CTiebaPage
        as integer pageSize, current, totalCount
        as integer hasNext, hasPrev
        as ctiebame_f ptr me
    end type
    
    enum CTiebaManagerType
        NOT_MANAGER
        MASTER_ADMINISTRATOR
        MINOR_ADMINISTRATOR
    end enum
    '////////////////////////////////////
    'Basic structure: User Bar Thread Post SubPost
    '////////////////////////////////////
    
    type CTiebaUser
        as string id, name
        
        '// Details
        as string avatar
        as ctiebame_f ptr me
    end type
    
    type CTiebaThread
        as string id, title
        as integer replyNum
        as double lastTime
        as integer isTop, isGood, isNtitle, isMemberTop, isNotice
        as integer isPortal, isBakan, isVote, isVoice, isActivity
        as string firstPostId
        as CTiebaUser author
        as integer zanNum
        as string zanIds(any)
        as double lastZanTime
        as string outline
        as ctiebame_f ptr me
    end type
    
    type CTiebaBar
        as string id, name
        as string avatar
        as integer isLike, isSign
        
        as integer isBlack, isBlock, daysToFree, level
        as CTiebaManagerType isManager
        as string levelName
        as string currentScore, levelupScore
        
        as string majorClass, minorClass
        as string slogan
        as string memberCount, threadCount, postCount
        as CTiebaUser managers(any)
        
        as CTiebaGoodClassify  goodClassify(any)
        as integer currentGoodClassify
        
        as CTiebaThread  threadList(any)
        as CTiebaPage   pageInfo
        
        as ctiebame_f ptr me
    end type
    
    type CTiebaPost
        'TODO
        as string id
        as CTiebaUser author
        
        as ctiebame_f ptr me
    end type
    
    type CTiebaSubPost
        'TODO
        as string id
        as ctiebame_f ptr me
    end type
    
    '////////////////////////////////////
    'HTTP core
    '////////////////////////////////////
    type CTiebaHttp
      public:
        declare constructor()
        declare sub header_push( BDUSS as string = "" )
        declare sub header_add( key as string, value as string )
        declare function header_pop() as string
        declare static function random_str( length as integer ) as string
        declare static function random_hexstr( length as integer ) as string
        as CLionetHttp http
        as ctiebame_f ptr me
      protected:
        as string m_imei, m_client_id, m_cuid
        const MAX_ITEM = 256
        as string m_key( MAX_ITEM - 1 ), m_val( MAX_ITEM - 1 ), m_BDUSS
        as integer m_top = 0
    end type
    
    
    '////////////////////////////////////
    'Operation result
    '////////////////////////////////////
    type CTiebaSignResult
        as integer bonus
        as integer ordinal
        as integer continuous
        as integer total
        as integer miss
        as integer orange
        as string  level_name
        as integer levelup_target
    end type
    
    '////////////////////////////////////
    'Main structure - First Person
    '////////////////////////////////////
    type CTiebaMe
      public:
        declare constructor()
        declare destructor()
        declare sub login( bduss as string )
        declare function isLoggedIn() as integer
        
        declare sub refreshLikesList()
        declare sub refreshTbs()
        
        declare sub signBar( bar as CTiebaBar )
        declare function signBarX( bar as CTiebaBar ) as CTiebaSignResult
        declare sub signAllBars()
        
        declare function getBar( barName as string, pageNum as integer = 1 ) as CTiebaBar
        
        as CTiebaHttp sender
        as CTiebaUser user
        as CTiebaBar likes(any)
        
        as string bduss
        as string tbs
        
        '////Errors
      public:
        declare function isErr() as integer
        declare function getErr() as string
        declare sub setErr( s as string )
        declare sub clearErr()
        declare sub holdErr()
        declare sub unholdErr()
      protected:
        as integer f_err
        as integer f_holded
        as string lasterr
    end type
    
    
    '////////////////////////////////////
    'Utils
    '////////////////////////////////////
    declare function md5( source as string ) as string
    declare function unix_timestamp( a_time as double ) as integer
    declare function unix_timestamp2double( a_time as integer ) as double
    declare function unix_millitimestamp( a_time as double ) as string
    declare function now_utc() as double
    declare function strrev( s as string ) as string
    declare function to_utf8( source as string ) as string
    declare function from_utf8( source as string ) as string
    declare function from_unicode( source as string ) as string
    declare function urlencode( source as string ) as string
    declare function _json_str_decode( source as string ) as string
    
    declare function json_parse( json as string ) as any ptr
    declare function json_sub_str( obj as any ptr, key as string ) as string
    declare function json_str( obj as any ptr ) as string
    declare function json_sub_int( obj as any ptr, key as string ) as integer
    declare function json_int( obj as any ptr ) as integer
    declare function json_sub( obj as any ptr, key as string ) as any ptr
    declare function json_arrlen( obj as any ptr ) as integer
    declare function json_arridx( obj as any ptr, idx as integer ) as any ptr
    declare sub json_free( json as any ptr )
end namespace
#endif