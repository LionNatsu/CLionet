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
    
    sub CTiebaMe.login( bduss as string )
        this.clear_err()
        this.bduss = mid( bduss, instr( bduss, "=" ) + 1 )
        this.http->http.open("http://c.tieba.baidu.com/c/s/login", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "bdusstoken", this.bduss & "|" & "NULL" )
            this.http->header_add( "channel_id", "" )
            this.http->header_add( "channel_uid", "" )
        this.http->http.send( this.http->header_pop() )
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        if json_object_get_int( json_object_object_get( root, "error_code" ) ) <> 0 then
            this.set_err( from_utf8( *json_object_get_string( json_object_object_get( root, "error_msg" ) ) ) )
            json_object_put( root )
            this.bduss = ""
            return
        endif
        dim as json_object ptr _user = json_object_object_get( root, "user" )
        dim as json_object ptr _anti = json_object_object_get( root, "anti" )
        this.user->id = *json_object_get_string( json_object_object_get( _user, "id" ) )
        this.user->name = *json_object_get_string( json_object_object_get( _user, "name" ) )
        this.tbs = *json_object_get_string( json_object_object_get( _anti, "tbs" ) )
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
        dim as json_object ptr root = json_tokener_parse( this.http->http.responseString )
        if json_object_get_int( json_object_object_get( root, "error_code" ) ) <> 0 then
            this.set_err( from_utf8( *json_object_get_string( json_object_object_get( root, "error_msg" ) ) ) )
            json_object_put( root )
            return
        endif
        this.bars->clear()
        dim as json_object ptr like_forums = json_object_object_get( root, "like_forum" )
        for i as integer = 0 to json_object_array_length( like_forums ) - 1
            dim as json_object ptr forums = json_object_array_get_idx( like_forums, i )
            dim as CTiebaBar ptr ba = new CTiebaBar()
            ba->id = *json_object_get_string( json_object_object_get( forums, "forum_id" ) )
            ba->avatar = from_utf8( *json_object_get_string( json_object_object_get( forums, "avatar" ) ) )
            ba->is_sign = json_object_get_int( json_object_object_get( forums, "is_sign" ) )
            ba->name = from_utf8( *json_object_get_string( json_object_object_get( forums, "forum_name" ) ) )
            ba->level = json_object_get_int( json_object_object_get( forums, "level_id" ) )
            this.bars->addItem( ba )
        next
        json_object_put( root )
    end sub
    
    sub CTiebaMe.signBar( bar as CTiebaBar)
        this.clear_err()
        this.http->http.open("http://c.tieba.baidu.com/c/c/forum/sign", "POST")
        this.http->header_push( this.bduss )
            this.http->header_add( "fid", bar.id )
            this.http->header_add( "kw", bar.name )
            this.http->header_add( "tbs", this.tbs )
            'print this.http->header_pop()
        this.http->http.send( this.http->header_pop() )
        print "json: ",json_decode( this.http->http.responseString )
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
        this.tbs = from_utf8( *json_object_get_string( json_object_object_get( root, "tbs" ) ) )
        json_object_put( root )
    end sub
end namespace
