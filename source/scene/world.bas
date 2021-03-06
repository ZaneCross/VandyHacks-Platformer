'World.bas
#include "../map/map.bas"
#include "../entity/player.bas"
#include "../entity/enemy.bas"


type World
    private:
        dim currMap as Map
        dim character as Player
        dim theMonsterWhoShallNotBeNamed as Enemy
    public:
        declare sub init()
        declare sub update(byval moveOff as double)
        declare sub render(byval Cam as Camera, byref res as ResLoader)
        
        declare function getChar() as Player
end type

sub World.init()
    this.currMap.loadMap()
    this.character.init()
end sub


sub World.update(byval moveOff as double)
    if moveOff > 1/30 then
        moveOff = 0
    end if
    this.character.update(moveOff, this.currMap)
end sub

sub World.render(byval cam as Camera, byref res as ResLoader)
    ' render world background
    put (0, 0), res.getBackgroundImg()

    ' render everything else
    this.currMap.render(cam, res)
    this.character.render(res, cam)
end sub

function World.getChar() as Player
    return this.character
end function

    