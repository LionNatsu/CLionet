#include "CTieba.bi"

namespace CTieba
    
    constructor CTiebaHttp()
        this.m_imei =  random_str(15)
        this.m_client_id = "wappc_" & unix_millitimestamp( now_utc() ) & "_" & random_str(3)
        this.m_cuid = ucase( random_hexstr( 32 ) ) & "|" & strrev(this.m_imei)
    end constructor
    
    sub CTiebaHttp.header_push( BDUSS as string )
        this.http.setRequestHeader( "Cookie", "ka=open" )
        this.http.setRequestHeader( "sid", random_hexstr(16) )
        this.http.setRequestHeader( "net", "3" )
        this.http.setRequestHeader( "User-Agent", "bdtb for Android 6.2.2" )
        this.m_top = 0
        if BDUSS <> "" then this.header_add( "BDUSS", BDUSS )
        this.header_add( "_client_id", this.m_client_id )
        this.header_add( "_client_type", "2")
        this.header_add( "_client_version", "6.2.2" )
        this.header_add( "_phone_imei", this.m_imei )
        this.header_add( "cuid", this.m_cuid )
        this.header_add( "from", "ad_wandoujia" )
        this.header_add( "model", "Samsung Galaxy Note 3 - 4.4.2 - API 19 - 1080x1920" )
        this.header_add( "stErrorNums", "0" )
        this.header_add( "stMethod", "1" )
        this.header_add( "stMode", "1" )
        this.header_add( "stSize", random_str(5) )
        this.header_add( "stTime", random_str(3) )
        this.header_add( "stTimesNum", "0" )
        this.header_add( "timestamp", unix_millitimestamp( now_utc() ) )
    end sub
    
    sub CTiebaHttp.header_add( key as string, value as string )
        this.me->clearErr()
        if this.m_top >= this.MAX_ITEM then this.me->setErr( "Too much arguments" ) : return
        this.m_key( this.m_top ) = key
        this.m_val( this.m_top ) = value
        this.m_top += 1
    end sub
    
    function CTiebaHttp.header_pop() as string
        'sort
        dim as integer exchanged
        do
            exchanged = 0
            for i as integer = 0 to this.m_top - 2
                if this.m_key( i ) > this.m_key( i + 1 ) then
                    dim as string temp_s
                    temp_s = this.m_key( i + 1 )
                    this.m_key( i + 1 ) = this.m_key( i )
                    this.m_key( i ) = temp_s
                    temp_s = this.m_val( i + 1 )
                    this.m_val( i + 1 ) = this.m_val( i )
                    this.m_val( i ) = temp_s
                    exchanged = 1
                endif
            next
        loop until exchanged = 0
        
        'sign
        dim as string ret
        ret = to_utf8( this.m_key( 0 ) ) & "=" & to_utf8( this.m_val( 0 ) )
        for i as integer = 1 to this.m_top - 1
            ret += to_utf8( this.m_key( i ) ) & "=" & to_utf8( this.m_val( i ) )
        next
        ret += "tiebaclient!!!"
        this.header_add( "sign", md5( ret ) )
        ret = urlencode( this.m_key( 0 ) ) & "=" & urlencode( this.m_val( 0 ) )
        for i as integer = 1 to this.m_top - 1
            ret += "&" & urlencode( this.m_key( i ) ) & "=" & urlencode( this.m_val( i ) )
        next
        this.m_top -= 1
        return ret
    end function
    
    function CTiebaHttp.random_str( length as integer ) as string
        dim as string ret
        for i as integer = 1 to length
            ret += str( int( rnd * 10 ) )
        next
        return ret
    end function
    
    function CTiebaHttp.random_hexstr( length as integer ) as string
        dim as string ret
        for i as integer = 1 to length
            ret += hex( int( rnd * 16 ) )
        next
        return ret
    end function
end namespace
