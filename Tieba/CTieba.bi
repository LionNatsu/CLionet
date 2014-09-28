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
    
    '////////////////////////////////////
    'Array structure for objects
    '////////////////////////////////////
    type CTiebaArray extends object
      public:
        declare sub clear()
        declare virtual sub addItem( lpObj as any ptr )
        declare abstract sub removeItem( i as integer )
        declare property count() as integer
        as ctiebame_f ptr me
      protected:
        declare destructor()
        declare function _removeItem_can_remove( i as integer ) as integer
        declare sub _removeItem_swap( i as integer )
        as any ptr ptr items
        as integer m_count
    end type
    
        '////////////////////////////////////
        'CTieba***Array
        '////////////////////////////////////
        #macro MAKE_ARRAY_RM( x, e )
            type x extends CTiebaArray
                declare destructor()
                declare sub removeItem( i as integer )
                declare function index( i as integer ) as e ptr
                declare operator let( rhs as x )
            end type
        #endmacro
        
        MAKE_ARRAY_RM( CTiebaSubPostArray, ctiebasubpost_f )
        MAKE_ARRAY_RM( CTiebaPostArray, ctiebapost_f )
        MAKE_ARRAY_RM( CTiebaThreadArray, ctiebathread_f )
        MAKE_ARRAY_RM( CTiebaBarArray, ctiebabar_f )
        MAKE_ARRAY_RM( CTiebaUserArray, ctiebauser_f )
        MAKE_ARRAY_RM( CTiebaGoodClassifyArray, ctiebagoodclassify_f )
        
        #undef MAKE_ARRAY_RM
        
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
        as CTiebaBarArray likes
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
        
        as CTiebaGoodClassifyArray  goodClassify
        as integer                  currentGoodClassify
        
        as CTiebaUserArray          managers
        
        as CTiebaThreadArray        threadList
        as CTiebaPage               pageInfo
        
        as ctiebame_f ptr me
    end type
    
    type CTiebaThread
        declare constructor()
        declare destructor()
        as string id, title
        as integer replyNum
        as double lastTime
        as integer isTop, isGood, isNtitle, isMemberTop, isNotice
        as integer isPortal, isBakan, isVote, isVoice, isActivity
        as ctiebapost_f ptr firstPost
        as ctiebauser_f ptr author
        as integer zanNum
        as CTiebaUserArray zanId
        as double lastZanTime
        as string outline
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
        
        declare sub refreshBarsList()
        declare sub refreshTbs()
        
        declare sub signBar( bar as CTiebaBar )
        declare function signBarX( bar as CTiebaBar ) as CTiebaSignResult
        declare sub signAllBars()
        
        declare function getBar( barName as string, pageNum as integer = 1 ) as CTiebaBar
        
        as CTiebaHttp sender
        as CTiebaUser user
        
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
    declare function json_decode( source as string ) as string
end namespace
#endif