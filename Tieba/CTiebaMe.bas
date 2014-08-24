#include "CTieba.bi"
#include "json-c/json.bi"

namespace CTieba
    
    constructor CTiebaMe()
        this.user = new CTiebaUser()
        this.bars = new CTiebaBarArray()
        this.http = new CTiebaHttp()
        this.user->me = @this
        this.bars->me = @this
        this.http->me = @this
    end constructor
    
    destructor CTiebaMe()
        delete( this.http )
        delete( this.bars )
        delete( this.user )
    end destructor
    
    function CTiebaMe.is_err() as integer
        return this.f_err <> 0
    end function
    
    function CTiebaMe.get_err() as string
        return this.lasterr
    end function
    
    sub CTiebaMe.set_err( s as string )
        this.f_err = -1
        this.lasterr = s
    end sub
    
    sub CTiebaMe.clear_err()
        this.f_err = 0
    end sub
    
    #macro PARSE_AND_SETERR_1( root )
        if json_object_get_int( json_object_object_get( root, "error_code" ) ) <> 0 then
            this.set_err( from_utf8( *json_object_get_string( json_object_object_get( root, "error_msg" ) ) ) )
    #endmacro
    
    #macro PARSE_AND_SETERR_2( root )
            json_object_put( root )
            return
        endif
    #endmacro
    
    function json_to_fb_string( obj as json_object ptr ) as string
        return from_utf8( *json_object_get_string( obj ) )
    end function
    
    sub CTiebaMe.login( bduss as string )
        this.clear_err()
        this.bduss = mid( bduss, instr( bduss, "=" ) + 1 )
        this.http->http.open("http://c.tieba.baidu.com/c/s/login", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "bdusstoken", this.bduss & "|" & "NULL" )
            this.http->header_add( "channel_id", "" )
            this.http->header_add( "channel_uid", "" )
        this.http->http.send( this.http->header_pop() )
        
        this.user->id = ""
        this.user->name = ""
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
            this.bduss = ""
        PARSE_AND_SETERR_2( root )
        
        dim as json_object ptr _user = json_object_object_get( root, "user" )
        dim as json_object ptr _anti = json_object_object_get( root, "anti" )
        this.user->id = json_to_fb_string( json_object_object_get( _user, "id" ) )
        this.user->name = json_to_fb_string( json_object_object_get( _user, "name" ) )
        this.tbs = json_to_fb_string( json_object_object_get( _anti, "tbs" ) )
        json_object_put( root )
    end sub
    
    sub CTiebaMe.refreshBarsList()
        this.clear_err()
        this.http->http.open("http://c.tieba.baidu.com/c/f/forum/forumrecommend", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "like_forum", "1" )
            this.http->header_add( "recommend", "0" )
            this.http->header_add( "topic", "0" )
        this.http->http.send( this.http->header_pop() )
        
        this.bars->clear()
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
        PARSE_AND_SETERR_2( root )
        
        dim as json_object ptr like_forums = json_object_object_get( root, "like_forum" )
        for i as integer = 0 to json_object_array_length( like_forums ) - 1
            dim as json_object ptr forums = json_object_array_get_idx( like_forums, i )
            dim as CTiebaBar ptr ba = new CTiebaBar()
            ba->id = json_to_fb_string( json_object_object_get( forums, "forum_id" ) )
            ba->avatar = json_to_fb_string( json_object_object_get( forums, "avatar" ) )
            ba->is_sign = json_object_get_int( json_object_object_get( forums, "is_sign" ) )
            ba->name = json_to_fb_string( json_object_object_get( forums, "forum_name" ) )
            ba->level = json_object_get_int( json_object_object_get( forums, "level_id" ) )
            this.bars->addItem( ba )
        next
        json_object_put( root )
    end sub
    
    sub CTiebaMe.signBar( bar as CTiebaBar, result as CTiebaSignResult )
        this.clear_err()
        this.http->http.open("http://c.tieba.baidu.com/c/c/forum/sign", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "fid", bar.id )
            this.http->header_add( "kw", bar.name )
            this.http->header_add( "tbs", this.tbs )
        this.http->http.send( this.http->header_pop() )
        
        dim as CTiebaSignResult _result
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
        PARSE_AND_SETERR_2( root )
        
        dim as json_object ptr info = json_object_object_get( root, "user_info" )
        _result.bonus = json_object_get_int( json_object_object_get( info, "sign_bonus_point" ) )
        _result._is_sign_in = json_object_get_int( json_object_object_get( info, "is_sign_in" ) )
        _result.ordinal = json_object_get_int( json_object_object_get( info, "user_sign_rank" ) )
        _result.continuous = json_object_get_int( json_object_object_get( info, "cont_sign_num" ) )
        _result.total = json_object_get_int( json_object_object_get( info, "total_sign_num" ) )
        _result.miss = json_object_get_int( json_object_object_get( info, "miss_sign_num" ) )
        _result.orange = json_object_get_int( json_object_object_get( info, "is_org_name" ) )
        _result.level_name = json_to_fb_string( json_object_object_get( info, "level_name" ) )
        _result.levelup_target = json_object_get_int( json_object_object_get( info, "levelup_score" ) )
        result = _result
        json_object_put( root )
    end sub
        
    sub CTiebaMe.signBar( bar as CTiebaBar )
        dim temp as CTiebaSignResult
        this.signBar( bar, temp )
    end sub
    
    sub CTiebaMe.refreshTbs()
        this.clear_err()
        this.http->http.open( "http://tieba.baidu.com/dc/common/tbs" )
        this.http->http.setRequestHeader( "Cookie", "BDUSS=" & this.bduss )
        this.http->http.send()
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        if json_object_get_int( json_object_object_get( root, "is_login" ) ) <> 1 then
            this.set_err( "Not logged in" )
            json_object_put( root )
            return
        endif
        this.tbs = json_to_fb_string( json_object_object_get( root, "tbs" ) )
        json_object_put( root )
    end sub
    
    #undef PARSE_AND_SETERR_1
    #undef PARSE_AND_SETERR_2
end namespace
