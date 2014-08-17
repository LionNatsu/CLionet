#include "CTieba.bi"

namespace CTieba
    
    destructor CTiebaArray()
        this.clear()
    end destructor
    
    sub CTiebaArray.clear()
        do : this.removeItem( 1 ) : loop until this.count = 0
    end sub
    
    sub CTiebaArray.addItem( lpObj as any ptr )
        if this.m_count = 0 then this.items = 0
        this.m_count += 1
        this.items = reallocate( this.items, sizeof( any ptr ) * this.m_count )
        this.items[ this.m_count - 1 ] = lpObj
    end sub
    
    function CTiebaArray._removeItem_can_remove( i as integer ) as integer
        if i > this.m_count then return 0
        if this.m_count = 0 then return 0
        return -1
    end function
    
    sub CTiebaArray._removeItem_swap( i as integer )
        this.items[ i - 1 ] = this.items[ this.m_count - 1 ]
        this.m_count -= 1
        this.items = reallocate( this.items, sizeof( any ptr ) * this.m_count )
    end sub
    
    property CTiebaArray.count() as integer
        return this.m_count
    end property
    
    '////////////////////////////////////
    'CTiebaBarArray
    '////////////////////////////////////
    sub CTiebaBarArray.removeItem( i as integer )
        if this._removeItem_can_remove( i ) = 0 then return
        delete( this.index( i ) )
        this._removeItem_swap( i )
    end sub
    
    function CTiebaBarArray.index( i as integer ) as CTiebaBar ptr
        return cast( CTiebaBar ptr, this.items[ i - 1 ] )
    end function
    
    '////////////////////////////////////
    'CTiebaUserArray
    '////////////////////////////////////
    sub CTiebaUserArray.removeItem( i as integer )
        if this._removeItem_can_remove( i ) = 0 then return
        delete( this.index( i ) )
        this._removeItem_swap( i )
    end sub
    
    function CTiebaUserArray.index( i as integer ) as CTiebaUser ptr
        return cast( CTiebaUser ptr, this.items[ i - 1 ] )
    end function
    
end namespace