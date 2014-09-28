#include "CTieba.bi"
#include "windows.bi"
#include "win/wincrypt.bi"
#include "datetime.bi"
#include "string.bi"
#include "crt.bi"

namespace CTieba
    
    '/////////////////////////////////////   MODULES   ////////////////////////////////////////////
    
    function md5( source as string ) as string
        dim hProv as HCRYPTPROV, hHash as HCRYPTHASH
        dim buffer(15) as byte, cbHash as integer = 16, ret as string
        if CryptAcquireContext( @hProv, 0, 0, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT ) then
            if CryptCreateHash( hProv, CALG_MD5, 0, 0, @hHash ) then
                if CryptHashData( hHash, strptr( source ), len( source ), 0 ) then
                    if CryptGetHashParam( hHash, HP_HASHVAL, @buffer( 0 ), @cbHash, 0 ) then
                        for i as integer = 0 to 15
                            ret += hex( buffer( i ), 2 )
                        next
                    endif
                endif
                CryptDestroyHash( hHash )
            endif
            CryptReleaseContext( hProv, 0 )
        endif
        return ret
    end function
    
    function to_utf8( source as string ) as string
        dim as integer buffer_length, buffer_length2
        buffer_length = MultiByteToWideChar( CP_ACP, 0, strptr( source ), len( source ), 0, 0 )
        if buffer_length = 0 then return ""
        redim as short ucs_buffer( buffer_length + 1 )
        MultiByteToWideChar( CP_ACP, 0, strptr( source ), len( source ), @ucs_buffer( 0 ), buffer_length )
        buffer_length2 = buffer_length
        buffer_length = WideCharToMultiByte( CP_UTF8, 0, @ucs_buffer( 0 ), buffer_length2, 0, 0, 0, 0 )
        if buffer_length = 0 then return ""
        redim as byte utf8_buffer( buffer_length + 1 )
        WideCharToMultiByte( CP_UTF8, 0, @ucs_buffer( 0 ), buffer_length2, @utf8_buffer( 0 ), buffer_length, 0, 0 )
        dim as string ret = left( *cast( zstring ptr, @utf8_buffer( 0 ) ), buffer_length )
        return ret
    end function
    
    function from_utf8( source as string ) as string
        dim as integer buffer_length, buffer_length2
        buffer_length = MultiByteToWideChar( CP_UTF8, 0, strptr( source ), len( source ), 0, 0 )
        if buffer_length = 0 then return ""
        redim as short ucs_buffer( buffer_length + 1 )
        MultiByteToWideChar( CP_UTF8, 0, strptr( source ), len( source ), @ucs_buffer( 0 ), buffer_length )
        buffer_length2 = buffer_length
        buffer_length = WideCharToMultiByte( CP_ACP, 0, @ucs_buffer( 0 ), buffer_length2, 0, 0, 0, 0 )
        if buffer_length = 0 then return ""
        redim as byte utf8_buffer( buffer_length + 1 )
        WideCharToMultiByte( CP_ACP, 0, @ucs_buffer( 0 ), buffer_length2, @utf8_buffer( 0 ), buffer_length, 0, 0 )
        dim as string ret = left( *cast( zstring ptr, @utf8_buffer( 0 ) ), buffer_length )
        return ret
    end function
    
    function from_unicode( source as string ) as string
        dim as integer buffer_length
        buffer_length = WideCharToMultiByte( CP_ACP, 0, cast( wstring ptr, strptr( source ) ), len( source ) \ 2, 0, 0, 0, 0 )
        if buffer_length = 0 then return ""
        redim as byte utf8_buffer( buffer_length + 1 )
        WideCharToMultiByte( CP_ACP, 0, cast( wstring ptr, strptr( source ) ), len( source ) \ 2, @utf8_buffer( 0 ), buffer_length, 0, 0 )
        dim as string ret = left( *cast( zstring ptr, @utf8_buffer( 0 ) ), buffer_length )
        return ret
    end function
    
    function urlencode( source as string ) as string
        dim as string utf8_buffer = to_utf8( source )
        if len( utf8_buffer ) = 0 then return ""
        dim as string ret
        for i as integer = 0 to len( utf8_buffer )
            select case utf8_buffer[ i ]
                case 0
                    exit for
                case asc( "A" ) to asc( "Z" ) 
                    ret += chr( utf8_buffer[ i ] )
                case asc( "a" ) to asc( "z" )
                    ret += chr( utf8_buffer[ i ] )
                case asc( "0" ) to asc( "9" )
                    ret += chr( utf8_buffer[ i ] )
                case asc( "-" )
                    ret += chr( utf8_buffer[ i ] )
                case asc( "_" )
                    ret += chr( utf8_buffer[ i ] )
                case asc( "." )
                    ret += chr( utf8_buffer[ i ] )
                case asc( " " )
                    ret += "+"
                case else
                    ret += "%" & ucase( hex( utf8_buffer[ i ], 2 ) )
            end select
        next
        return ret
    end function
    
    function json_decode( source as string ) as string
        dim as string utf8_buffer, ret
        dim as integer i
        do while i < len( source )
            if source[ i ] = asc( "\" ) then
                select case chr( source[ i + 1 ] )
                    case "\"
                        utf8_buffer += "\"
                    case "/"
                        utf8_buffer += "/"
                    case """"
                        utf8_buffer += """"
                    case "n"
                        utf8_buffer += !"\r\n"
                    case "u"
                        utf8_buffer += from_unicode( chr( valint( "&H" & chr( source[ i + 4 ] )  & chr( source[ i + 5 ] ) ) ) _
                                                   & chr( valint( "&H" & chr( source[ i + 2 ] )  & chr( source[ i + 3 ] ) ) ) )
                        i += 4
                    case else
                        utf8_buffer += chr( source[ i ] )
                        i -= 1
                end select
                i += 1
            else
                utf8_buffer += chr( source[ i ] )
            endif
            i += 1
        loop
        return utf8_buffer
    end function
    
    function unix_timestamp( a_time as double ) as integer
        return datediff( "s", dateserial( 1970, 1, 1 ) + timeserial( 0, 0, 0 ), a_time )
    end function
    
    function unix_timestamp2double( a_time as integer ) as double
        dim fbutc as double
        fbutc = dateadd( "s", a_time, dateserial( 1970, 1, 1 ) + timeserial( 0, 0, 0 ) )
        dim systime as SYSTEMTIME, localsystime as SYSTEMTIME
        systime = type( year( fbutc ), month( fbutc ), weekday( fbutc ), day( fbutc ), hour( fbutc ), minute( fbutc ), second( fbutc ), 0 )
        SystemTimeToTzSpecificLocalTime( 0, @systime, @localsystime )
        systime = localsystime
        return dateserial( systime.wYear, systime.wMonth, systime.wDay ) + timeserial( systime.wHour, systime.wMinute, systime.wSecond )
    end function
    
    function unix_millitimestamp( a_time as double ) as string
        randomize
        return str( unix_timestamp( a_time ) ) & format( int( rnd * 1000 ), "000" )
    end function
    
    function now_utc() as double
        dim as SYSTEMTIME systime
        GetSystemTime( @systime )
        return dateserial( systime.wYear, systime.wMonth, systime.wDay ) + timeserial( systime.wHour, systime.wMinute, systime.wSecond )
    end function
    
    function strrev( s as string ) as string
        return *_strrev( s )
    end function
end namespace
