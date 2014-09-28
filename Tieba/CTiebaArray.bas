#include "CTieba.bi"

namespace CTieba
    destructor CTiebaArray()
        this.clear()
    end destructor
    
    sub CTiebaArray.clear()
        do until this.count = 0 : this.removeItem( 1 ) : loop
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
    
    #macro MAKE_ARRAY_RM( x, e )
        destructor x()
            base.destructor()
        end destructor
        operator x.let( rhs as x )
            this.m_count = rhs.m_count
            this.items = reallocate( this.items, sizeof( any ptr ) * this.m_count )
            this.me = rhs.me
            if this.m_count = 0 then return
            for i as integer = 0 to this.m_count - 1
                dim as e ptr newelement = new e()
                *newelement = *cast( e ptr, rhs.items[ i ] )
                this.items[ i ] = newelement
            next
        end operator
        sub x.removeItem( i as integer )
            if this._removeItem_can_remove( i ) = 0 then return
            delete this.index( i )
            this._removeItem_swap( i )
        end sub
        function x.index( i as integer ) as e ptr
            return cast( e ptr, this.items[ i - 1 ] )
        end function
    #endmacro
    
    '////////////////////////////////////
    'CTieba***Array
    '////////////////////////////////////
    MAKE_ARRAY_RM( CTiebaSubPostArray, CTiebaSubPost )
    MAKE_ARRAY_RM( CTiebaPostArray, CTiebaPost )
    MAKE_ARRAY_RM( CTiebaThreadArray, CTiebaThread )
    MAKE_ARRAY_RM( CTiebaBarArray, CTiebaBar )
    MAKE_ARRAY_RM( CTiebaUserArray, CTiebaUser )
    MAKE_ARRAY_RM( CTiebaGoodClassifyArray, CTiebaGoodClassify )
    
    #undef MAKE_ARRAY_RM
    #undef MAKE_ARRAY_RM_STRING
end namespace