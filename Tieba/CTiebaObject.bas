#include "CTieba.bi"
#include "windows.bi"

namespace CTieba
    
    constructor CTiebaThread()
        this.author = new CTiebaUser()
        this.zanIds = CTiebaUser.CreateArray()
    end constructor
    
    destructor CTiebaThread()
        delete this.author
    end destructor
    
    operator CTiebaThread.let( rhs as CTiebaThread )
        delete this.author
        CopyMemory( @this, @rhs, sizeof( CTiebaThread ) )
        this.author = new CTiebaUser()
        *this.author = *rhs.author
    end operator
    
end namespace
