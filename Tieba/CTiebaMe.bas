#include "CTieba.bi"

namespace CTieba
    
    constructor CTiebaMe()
        this.user.me = @this
        this.sender.me = @this
    end constructor
    
    destructor CTiebaMe()
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
        if json_sub_int( root, "error_code" ) <> 0 then
            this.setErr( json_sub_str( root, "error_msg" ) )
    #endmacro
    
    #macro PARSE_AND_SETERR_2( root )
        endif
    #endmacro
    
    #macro PARSE_AND_REFRESHTBS( root )
        assert(json_sub_str( json_sub( root, "anti" ), "vcode_stat" ) = "0" or _
                json_sub_str( json_sub( root, "anti" ), "vcode_stat" ) = "")
        this.tbs = json_sub_str( json_sub( root, "anti" ), "tbs" )
    #endmacro
    
    #macro for_json_array_each( i, root, key )
        scope
            dim as any ptr ___FJA___ARR___ = json_sub( (root), (key) )
            if ___FJA___ARR___ <> 0 then
                for ___FJA___IDX___ as integer = 0 to json_arrlen( ___FJA___ARR___ ) - 1
                    dim as any ptr i = json_arridx( ___FJA___ARR___, ___FJA___IDX___ )
    #endmacro
    #macro for_next()
                next
            endif
        end scope
    #endmacro
    
    sub CTiebaMe.login( bduss as string )
        this.clearErr()
        this.bduss = mid( bduss, instr( bduss, "=" ) + 1 )
        this.sender.http.open("http://c.tieba.baidu.com/c/s/login", "POST")
        this.sender.header_push( this.bduss )
            this.sender.header_add( "bdusstoken", this.bduss & "|" & "NULL" )
            this.sender.header_add( "channel_id", "" )
            this.sender.header_add( "channel_uid", "" )
        this.sender.http.send( this.sender.header_pop() )
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return
        
        this.user.id = ""
        this.user.name = ""
        
        open "px.tmp" for output as 1:print #1,this.sender.http.responseString:close 1
        
        dim as any ptr root = json_parse( this.sender.http.responseString )
        PARSE_AND_SETERR_1( root )
            this.bduss = ""
            json_free( root )
            return
        PARSE_AND_SETERR_2( root )
        
        PARSE_AND_REFRESHTBS( root )
        
        dim as any ptr _user = json_sub( root, "user" )
            this.user.id = json_sub_str( _user, "id" )
            this.user.name = json_sub_str( _user, "name" )
        json_free( root )
        
        this.refreshLikesList()
    end sub
    
    function CTiebaMe.isLoggedIn() as integer
        this.clearErr()
        this.sender.http.open( "http://tieba.baidu.com/dc/common/tbs" )
        this.sender.http.setRequestHeader( "Cookie", "BDUSS=" & this.bduss )
        this.sender.http.send()
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return 0
        dim as any ptr root = json_parse( this.sender.http.responseString )
        dim _result as integer = json_sub_int( root, "is_login" ) = 1
        json_free( root )
        return _result
    end function
    
    sub CTiebaMe.refreshLikesList()
        this.clearErr()
        this.sender.http.open("http://c.tieba.baidu.com/c/f/forum/forumrecommend", "POST")
        this.sender.header_push( this.bduss )
            this.sender.header_add( "like_forum", "1" )
            this.sender.header_add( "recommend", "0" )
            this.sender.header_add( "thread", "0" )
        this.sender.http.send( this.sender.header_pop() )
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return
        
        erase this.likes
        dim as any ptr root = json_parse( this.sender.http.responseString )
        PARSE_AND_SETERR_1( root )
            json_free( root )
            return
        PARSE_AND_SETERR_2( root )
        
        for_json_array_each( bar, root, "like_forum" )
            dim as CTiebaBar ba
            ba.id = json_sub_str( bar, "forum_id" )
            ba.name = json_sub_str( bar, "forum_name" )
            ba.isSign = json_sub_int( bar, "isSign" )
            ba.avatar = json_sub_str( bar, "avatar" )
            ba.level = json_sub_int( bar, "level_id" )
            ba.isLike = 1
            ba.me = @this
            redim preserve this.likes( ubound( this.likes ) + 1 )
            this.likes( ubound( this.likes ) ) = ba
        for_next()
        
        json_free( root )
    end sub
    
    function CTiebaMe.signBarX( bar as CTiebaBar ) as CTiebaSignResult
        this.clearErr()
        this.sender.http.open("http://c.tieba.baidu.com/c/c/forum/sign", "POST")
        this.sender.header_push( this.bduss )
            this.sender.header_add( "fid", bar.id )
            this.sender.header_add( "kw", bar.name )
            this.sender.header_add( "tbs", this.tbs )
        this.sender.http.send( this.sender.header_pop() )
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return type<CTiebaSignResult>()
        
        dim as any ptr root = json_parse( this.sender.http.responseString )
        PARSE_AND_SETERR_1( root )
            json_free( root )
            return type<CTiebaSignResult>()
        PARSE_AND_SETERR_2( root )
        
        dim as CTiebaSignResult _result
        dim as any ptr info = json_sub( root, "user_info" )
            _result.bonus = json_sub_int( info, "sign_bonus_point" )
            _result.ordinal = json_sub_int( info, "user_sign_rank" )
            _result.continuous = json_sub_int( info, "cont_sign_num" )
            _result.total = json_sub_int( info, "total_sign_num" )
            _result.miss = json_sub_int( info, "miss_sign_num" )
            _result.orange = json_sub_int( info, "is_org_name" )
            _result.level_name = json_sub_str( info, "level_name" )
            _result.levelup_target = json_sub_int( info, "levelup_score" )
        json_free( root )
        return _result
    end function
    
    sub CTiebaMe.signBar( bar as CTiebaBar )
        dim temp as CTiebaSignResult
        temp = this.signBarX( bar )
    end sub
    
    sub CTiebaMe.signAllBars()
        this.clearErr()
        this.holdErr()
        
        for i as integer = 0 to ubound( this.likes )
            if this.likes(i).isSign = 0 then this.signBar( this.likes(i) )
        next
        
        this.unholdErr()
    end sub
    
    sub CTiebaMe.refreshTbs()
        this.clearErr()
        this.sender.http.open( "http://tieba.baidu.com/dc/common/tbs" )
        this.sender.http.setRequestHeader( "Cookie", "BDUSS=" & this.bduss )
        this.sender.http.send()
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return
        dim as any ptr root = json_parse( this.sender.http.responseString )
        this.tbs = json_sub_str( root, "tbs" )
        json_free( root )
    end sub
    
    function CTiebaMe.getBar( barName as string, pageNum as integer ) as CTiebaBar
        this.clearErr()
        this.sender.http.open("http://c.tieba.baidu.com/c/f/frs/page", "POST")
        this.sender.header_push( this.bduss )
            this.sender.header_add( "kw", barName )
            this.sender.header_add( "pn", str(pageNum) )
        this.sender.http.send( this.sender.header_pop() )
        if this.sender.http.state <> CLHS_COMPLETED then this.setErr( "Network error." ) : return type<CTiebaBar>()
        
        'open "px.tmp" for output as 1:print #1,this.sender.http.responseString:close 1
        
        dim as any ptr root = json_parse( this.sender.http.responseString )
        PARSE_AND_SETERR_1( root )
            json_free( root )
            return type<CTiebaBar>()
        PARSE_AND_SETERR_2( root )
        
        dim as CTiebaBar _result
        _result.me = @this
        dim as any ptr node
        dim as any ptr subnode
        with _result
          node = json_sub( root, "forum" )
            .id = json_sub_str( node, "id" )
            .name = json_sub_str( node, "name" )
            .avatar = json_sub_str( node, "avatar" )
            .isLike = json_sub_int( node, "is_like" )
            .isSign = json_sub_int( json_sub( json_sub( node, "sign_in_info" ), "user_info" ), "is_sign_in" )
            
            .majorClass = json_sub_str( node, "first_class" )
            .minorClass = json_sub_str( node, "second_class" )
            .level = json_sub_int( node, "user_level" ) ' the same as "level_id"
            .levelName = json_sub_str( node, "level_name" )
            .currentScore = json_sub_str( node, "cur_score" )
            .levelupScore = json_sub_str( node, "levelup_score" )
            .memberCount = json_sub_str( node, "member_num" )
            .threadCount = json_sub_str( node, "thread_num" )
            .postCount = json_sub_str( node, "post_num" )
            for_json_array_each( gc, node, "good_classify" )
                dim as CTiebaGoodClassify u
                u.id = json_sub_str( gc, "class_id" )
                u.name = json_sub_str( gc, "class_name" )
                u.me = @this
                redim preserve .goodClassify( ubound( .goodClassify ) + 1 )
                .goodClassify( ubound( .goodClassify ) ) = u
            for_next()
            
            for_json_array_each( manager, node, "managers" )
                dim as CTiebaUser u
                u.id = json_sub_str( manager, "id" )
                u.name = json_sub_str( manager, "name" )
                u.me = @this
                redim preserve .managers( ubound( .managers ) + 1 )
                .managers( ubound( .managers ) ) = u
            for_next()
            
            .slogan = json_sub_str( node, "slogan" )
            
          node = json_sub( root, "user" )
            .isBlack = json_sub_int( json_sub( node, "balv" ), "is_black" )
            .isBlock = json_sub_int( json_sub( node, "balv" ), "is_block" )
            .daysToFree = json_sub_int( json_sub( node, "balv" ), "days_tofree" )
            .isManager = json_sub_int( node, "is_manager" )
            
            for_json_array_each( thread, root, "thread_list" )
                dim as CTiebaThread t
                t.id = json_sub_str( thread, "id" )
                t.title = json_sub_str( thread, "title" )
                t.replyNum = json_sub_int( thread, "reply_num" )
                t.lastTime = unix_timestamp2double( json_sub_int( thread, "last_time_int" ) )
                t.isTop = json_sub_int( thread, "is_top" )
                t.isGood = json_sub_int( thread, "is_good" )
                t.isNtitle = json_sub_int( thread, "is_ntitle" )
                t.isMemberTop = json_sub_int( thread, "is_membertop" )
                t.isNotice = json_sub_int( thread, "is_notice" )
                t.isPortal = json_sub_int( thread, "is_protal" )
                t.isBakan = json_sub_int( thread, "is_bakan" )
                t.isVote = json_sub_int( thread, "is_vote" )
                t.isVoice = json_sub_int( thread, "is_voice_thread" )
                t.isActivity = json_sub_int( thread, "is_activity" )
                
              subnode = json_sub( thread, "zan" )
                t.zanNum = json_sub_int( subnode, "num" )
                
                for_json_array_each( zanEr, subnode, "liker_id" )
                    redim preserve t.zanIds( ubound( t.zanIds ) + 1 )
                    t.zanIds( ubound( t.zanIds ) ) = json_str( zanEr )
                for_next()
                
                t.lastZanTime = unix_timestamp2double( json_sub_int( subnode, "last_time" ) )
                t.outline = json_sub_str( json_arridx( json_sub( thread, "abstract" ), 0 ), "text" )
                
                t.firstPostId = json_sub_str( thread, "first_post_id" )
                t.author.id = json_sub_str( thread, "author_id" )
                '//TODO: thread_list
                
                t.me = @this
                redim preserve .threadList( ubound( .threadList ) + 1 )
                .threadList( ubound( .threadList ) ) = t
            for_next()
        end with
        json_free( root )
        return _result
    end function
    
    #undef PARSE_AND_SETERR_1
    #undef PARSE_AND_SETERR_2
    #undef PARSE_AND_REFRESHTBS
    #undef for_json_array_each
    #undef for_next
end namespace
