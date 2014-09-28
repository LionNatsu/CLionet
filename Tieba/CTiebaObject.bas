#include "CTieba.bi"

namespace CTieba
    constructor CTiebaThread()
        this.firstPost = new CTiebaPost()
        this.author = new CTiebaUser()
    end constructor
    destructor CTiebaThread()
        delete this.author
        delete this.firstPost
    end destructor
end namespace
