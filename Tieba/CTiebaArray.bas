#include "CTieba.bi"

namespace CTieba
    destructor CTiebaArray()
        this.clear()
    end destructor
    
    operator CTiebaArray.let( rhs as CTiebaArray )
        print "-"
        this.destructor()
        CopyMemory( @this, @rhs, sizeof( CTiebaArray ) )
        if custom_copy <> 0 then
            this.items = allocate( sizeof( any ptr ) * this.m_count )
            if this.m_count = 0 then return
            for i as integer = 0 to this.m_count - 1
                print "-"
                this.items[ i - 1 ] = this.custom_copy( rhs.items[ i - 1 ] )
            next
        endif
    end operator
    
    sub CTiebaArray.clear()
        do until this.count = 0 : this.removeItem( 1 ) : loop
    end sub
    
    sub CTiebaArray.addItem( lpObj as any ptr )
        if this.m_count = 0 then this.items = 0
        this.m_count += 1
        this.items = reallocate( this.items, sizeof( any ptr ) * this.m_count )
        this.items[ this.m_count - 1 ] = lpObj
    end sub
    
    function CTiebaArray.index( i as integer ) as any ptr
        return this.items[ i - 1 ]
    end function
    
    sub CTiebaArray.removeItem( i as integer )
        if this._removeItem_can_remove( i ) = 0 then return
        if custom_destructor <> 0 then custom_destructor( this.index( i ) )
        this._removeItem_swap( i )
    end sub
    
    property CTiebaArray.count() as integer
        return this.m_count
    end property
    
    function CTiebaArray._removeItem_can_remove( i as integer ) as integer
        if this.m_count = 0 then return 0
        if i > this.m_count then return 0
        return -1
    end function
    
    sub CTiebaArray._removeItem_swap( i as integer )
        this.items[ i - 1 ] = this.items[ this.m_count - 1 ]
        this.m_count -= 1
        this.items = reallocate( this.items, sizeof( any ptr ) * this.m_count )
    end sub
    
'///////////////////////////////////////////////////////////////////////////////////////
'/// Instances
    #macro __DEFINE_ARRAY_FUNCTIONS__( n )
    function n.custom_copy( kare as any ptr ) as any ptr
        dim as n ptr newp = new n()
        *newp = *cast( n ptr, kare )
        print #n, hex(kare) ;" -> "; hex(newp)
        return newp
    end function
    sub n.custom_destructor( boku as any ptr )
        print #n; boku;" deleted"
        delete cast( n ptr, boku )
    end sub
    function n.CreateArray() as CTiebaArray
        dim as CTiebaArray s
        print #n; " Create"
        s.custom_destructor = procptr( n.custom_destructor )
        s.custom_copy = procptr( n.custom_copy )
        return s
    end function
    #endmacro
    
    __DEFINE_ARRAY_FUNCTIONS__( CTiebaUser )
    __DEFINE_ARRAY_FUNCTIONS__( CTiebaBar )
    __DEFINE_ARRAY_FUNCTIONS__( CTiebaThread )
    __DEFINE_ARRAY_FUNCTIONS__( CTiebaPost )
    __DEFINE_ARRAY_FUNCTIONS__( CTiebaSubPost )
end namespace