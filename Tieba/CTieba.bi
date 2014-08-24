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
'   class CTiebaTopic
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
    
    '//Pseudo structure referring CTiebaMe
    type ctieba_f as CTiebaMe
    
    '////////////////////////////////////
    'Basic structure: User Bar Topic Post SubPost
    '////////////////////////////////////
    type CTiebaSubPost
        'TODO
        as string id
        as ctieba_f ptr me
    end type
    
    type CTiebaPost
        'TODO
        as string id
        as ctieba_f ptr me
    end type
    
    type CTiebaTopic
        'TODO
        as string id
        as ctieba_f ptr me
    end type
    
    type CTiebaBar
        as string id, name
        as integer isSign, level
        as string avatar
        as integer isLike
        
        '/////////
        '//Details
        as string levelName
        as string curScore, levelupScore
        
        as string slogan
        as string memberCount, threadCount, postCount
        as string ptr essenceClassify
        as string ptr essenceClassifyCount
        as ctieba_f ptr me
    end type
    
    type CTiebaUser
        as string id, name
        as ctieba_f ptr me
    end type
    
    
    '////////////////////////////////////
    'Array structure for objects
    '////////////////////////////////////
    type CTiebaArray extends object
      public:
        declare sub clear()
        declare virtual sub addItem( lpObj as any ptr )
        declare abstract sub removeItem( i as integer )
        declare property count() as integer
        as ctieba_f ptr me
      protected:
        declare destructor()
        declare function _removeItem_can_remove( i as integer ) as integer
        declare sub _removeItem_swap( i as integer )
        as any ptr ptr items
        as integer m_count
    end type
    
        type CTiebaBarArray extends CTiebaArray
            declare sub removeItem( i as integer )
            declare function index( i as integer ) as CTiebaBar ptr
        end type
        
        type CTiebaUserArray extends CTiebaArray
            declare sub removeItem( i as integer )
            declare function index( i as integer ) as CTiebaUser ptr
        end type
        
    
    type CTiebaStringArray extends object
        as integer m_count
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
        as ctieba_f ptr me
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
        
        declare sub refreshBarsList()
        declare sub refreshTbs()
        
        declare sub signBar( bar as CTiebaBar )
        declare sub signBar( bar as CTiebaBar, byref result as CTiebaSignResult )
        declare sub signAllBars()
        
        as CTiebaHttp ptr http
        as CTiebaUser ptr user
        as CTiebaBarArray ptr bars
        
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