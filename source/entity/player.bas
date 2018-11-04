type Player
    private:
        dim velocityX as integer
        dim velocityY as integer
    public:
        dim rect as Box
        declare sub init()
        declare sub update()
        declare sub render(byref res as ResLoader)
        declare sub onKeyPress(byval scancode as long)
        declare sub onKeyRelease(byval scancode as long)
end type

sub Player.init()
    this.rect.init(0, 0, 68, 121)
end sub

sub Player.update()
    this.rect.setBoxX(this.rect.getBoxX() + this.velocityX)
    this.rect.setBoxY(this.rect.getBoxY() + this.velocityY)
end sub

sub Player.render(byref res as ResLoader)
    put (this.rect.getBoxX(), this.rect.getBoxY()), res.getPlayerFrame(0), trans
end sub

sub Player.onKeyPress(byval scancode as long)
    if scancode = SC_A then
        this.velocityX = -1
    elseif scancode = SC_D then
        this.velocityX = 1
    end if
end sub


sub Player.onKeyRelease(byval scancode as long)
    if scancode = SC_A or scancode = SC_D then
        this.velocityX = 0
    end if
end sub
