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
    
    function CTiebaMe.isErr() as integer
        return this.f_err <> 0
    end function
    
    function CTiebaMe.getErr() as string
        return this.lasterr
    end function
    
    sub CTiebaMe.setErr( s as string )
        if this.f_holded andalso this.isErr() then return
        this.f_err = -1
        this.lasterr = s
    end sub
    
    sub CTiebaMe.clearErr()
        if this.f_holded then return
        this.f_err = 0
        this.lasterr = ""
    end sub
    
    sub CTiebaMe.holdErr()
        this.f_holded = -1
    end sub
    
    sub CTiebaMe.unholdErr()
        this.f_holded = 0
    end sub
    
    #macro PARSE_AND_SETERR_1( root )
        if json_object_get_int( json_object_object_get( root, "error_code" ) ) <> 0 then
            this.setErr( from_utf8( *json_object_get_string( json_object_object_get( root, "error_msg" ) ) ) )
    #endmacro
    
    #macro PARSE_AND_SETERR_2( root )
            json_object_put( root )
            return
        endif
    #endmacro
    
    #macro PARSE_AND_REFRESHTBS( root )
        this.tbs = json_to_fb_string( json_object_object_get( json_object_object_get( root, "anti" ), "tbs" ) )
    #endmacro
    
    function json_to_fb_string( obj as json_object ptr ) as string
        return from_utf8( *json_object_get_string( obj ) )
    end function
    
    sub CTiebaMe.login( bduss as string )
        this.clearErr()
        this.bduss = mid( bduss, instr( bduss, "=" ) + 1 )
        this.http->http.open("http://c.tieba.baidu.com/c/s/login", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "bdusstoken", this.bduss & "|" & "NULL" )
            this.http->header_add( "channel_id", "" )
            this.http->header_add( "channel_uid", "" )
        this.http->http.send( this.http->header_pop() )
        if this.http->http.state <> CLHS_COMPLETED then return
        
        this.user->id = ""
        this.user->name = ""
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
            this.bduss = ""
        PARSE_AND_SETERR_2( root )
        
        PARSE_AND_REFRESHTBS( root )
        
        dim as json_object ptr _user = json_object_object_get( root, "user" )
            this.user->id = json_to_fb_string( json_object_object_get( _user, "id" ) )
            this.user->name = json_to_fb_string( json_object_object_get( _user, "name" ) )
        
        json_object_put( root )
        
        'this.refreshBarsList()
        '
        'this.http->http.open("http://c.tieba.baidu.com/c/f/frs/page", "POST")
        'this.http->header_push( this.bduss )
        '    this.http->header_add( "kw", "ÐãÈ«ÖÐxÑ§" )
        '    this.http->header_add( "pn", "50" )
        'this.http->http.send( this.http->header_pop() )
        '
        'print json_decode(this.http->http.responseString)
        'end
    end sub
    
    sub CTiebaMe.refreshBarsList()
        this.clearErr()
        this.http->http.open("http://c.tieba.baidu.com/c/f/forum/forumrecommend", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "like_forum", "1" )
            this.http->header_add( "recommend", "0" )
            this.http->header_add( "topic", "0" )
        this.http->http.send( this.http->header_pop() )
        if this.http->http.state <> CLHS_COMPLETED then return
        
        this.bars->clear()
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
        PARSE_AND_SETERR_2( root )
        
        dim as json_object ptr like_forums = json_object_object_get( root, "like_forum" )
        for i as integer = 0 to json_object_array_length( like_forums ) - 1
            dim as json_object ptr forums = json_object_array_get_idx( like_forums, i )
            dim as CTiebaBar ptr ba = new CTiebaBar()
            ba->id = json_to_fb_string( json_object_object_get( forums, "forum_id" ) )
            ba->name = json_to_fb_string( json_object_object_get( forums, "forum_name" ) )
            ba->isSign = json_object_get_int( json_object_object_get( forums, "isSign" ) )
            ba->avatar = json_to_fb_string( json_object_object_get( forums, "avatar" ) )
            ba->level = json_object_get_int( json_object_object_get( forums, "level_id" ) )
            ba->isLike = 1
            this.bars->addItem( ba )
        next
        json_object_put( root )
    end sub
    
    sub CTiebaMe.signBar( bar as CTiebaBar, result as CTiebaSignResult )
        this.clearErr()
        this.http->http.open("http://c.tieba.baidu.com/c/c/forum/sign", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "fid", bar.id )
            this.http->header_add( "kw", bar.name )
            this.http->header_add( "tbs", this.tbs )
        this.http->http.send( this.http->header_pop() )
        if this.http->http.state <> CLHS_COMPLETED then return
        
        dim as CTiebaSignResult _result
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        PARSE_AND_SETERR_1( root )
        PARSE_AND_SETERR_2( root )
        
        dim as json_object ptr info = json_object_object_get( root, "user_info" )
        _result.bonus = json_object_get_int( json_object_object_get( info, "sign_bonus_point" ) )
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
    
    sub CTiebaMe.signAllBars()
        this.clearErr()
        this.holdErr()
        
        dim bars as CTieba.CTiebaBarArray ptr = this.bars
        for i as integer = 1 to bars->count
            dim bar as CTieba.CTiebaBar ptr = bars->index( i )
            if bar->isSign = 0 then this.signBar( *bar )
        next
        
        this.unholdErr()
    end sub
    
    sub CTiebaMe.refreshTbs()
        this.clearErr()
        this.http->http.open( "http://tieba.baidu.com/dc/common/tbs" )
        this.http->http.setRequestHeader( "Cookie", "BDUSS=" & this.bduss )
        this.http->http.send()
        if this.http->http.state <> CLHS_COMPLETED then return
        
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        if json_object_get_int( json_object_object_get( root, "is_login" ) ) <> 1 then
            this.setErr( "Not logged in" )
            json_object_put( root )
            return
        endif
        this.tbs = json_to_fb_string( json_object_object_get( root, "tbs" ) )
        json_object_put( root )
    end sub
    
    #undef PARSE_AND_SETERR_1
    #undef PARSE_AND_SETERR_2
    #undef PARSE_AND_REFRESHTBS
end namespace
