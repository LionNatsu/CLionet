#include "CTieba.bi"
#include "json-c/json.bi"

namespace CTieba
    function json_parse( json as string ) as any ptr
        return json_tokener_parse( json )
    end function
    
    function json_sub_str( obj as any ptr, key as string ) as string
        return json_str( json_sub( obj, key ) )
    end function
    
    function json_str( obj as any ptr ) as string
        if obj = 0 then return ""
        dim as zstring ptr s = json_object_get_string( obj )
        if s = 0 then return ""
        return from_utf8( *s )
    end function
    
    function json_sub_int( obj as any ptr, key as string ) as integer
        return json_int( json_sub( obj, key ) )
    end function
    
    function json_int( obj as any ptr ) as integer
        if obj = 0 then return 0
        return json_object_get_int( obj )
    end function
    
    function json_sub( obj as any ptr, key as string ) as any ptr
        if obj = 0 then return 0
        return json_object_object_get( obj, key )
    end function
    
    function json_arrlen( obj as any ptr ) as integer
        if obj = 0 then return 0
        return json_object_array_length( obj )
    end function
    
    function json_arridx( obj as any ptr, idx as integer ) as any ptr
        if obj = 0 then return 0
        return json_object_array_get_idx( obj, idx )
    end function
    
    sub json_free( root as any ptr )
        if root = 0 then return
        json_object_put( root )
    end sub
end namespace