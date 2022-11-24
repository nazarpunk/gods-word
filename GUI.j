library GUI initializer Init requires MISC, Main

define {
    HUMAN_UI = 1
    ORC_UI = 2
    ELF_UI = 3
    UNDEAD_UI = 4

    GUI_X(x) = (Left_X + x * 64) + 32.
    GUI_Y(y) = (Left_Y + y * 64) + 32.

    private BASE_ID = 'B01S'
    private BACKGROUND_HUMAN_ID = 'B02B'
    private BACKGROUND_ELF_ID = 'B015'
    private BACKGROUND_ORC_ID = 'B016'
    private BACKGROUND_UNDEAD_ID = 'B017'
    private BACKGROUND_BLACK_ID = 'B01T'

    private BORDER_ELF_DOWN = 'B00E'
    private BORDER_ELF_UP = 'B00H'
    private BORDER_ELF_LEFT = 'B00F'
    private BORDER_ELF_RIGHT = 'B00G'
    private BORDER_ELF_DOWN_LEFT = 'B00M'
    private BORDER_ELF_DOWN_RIGHT = 'B00N'
    private BORDER_ELF_UP_LEFT = 'B00O'
    private BORDER_ELF_UP_RIGHT = 'B00P'

    private BORDER_HUMAN_DOWN = 'B02C'
    private BORDER_HUMAN_UP = 'B02H'
    private BORDER_HUMAN_LEFT = 'B02F'
    private BORDER_HUMAN_RIGHT = 'B02G'
    private BORDER_HUMAN_DOWN_LEFT = 'B02D'
    private BORDER_HUMAN_DOWN_RIGHT = 'B02E'
    private BORDER_HUMAN_UP_LEFT = 'B02I'
    private BORDER_HUMAN_UP_RIGHT = 'B02J'

    private BORDER_ORC_DOWN = 'B00A'
    private BORDER_ORC_UP = 'B00D'
    private BORDER_ORC_LEFT = 'B00B'
    private BORDER_ORC_RIGHT = 'B00C'
    private BORDER_ORC_DOWN_LEFT = 'B00Q'
    private BORDER_ORC_DOWN_RIGHT = 'B00R'
    private BORDER_ORC_UP_LEFT = 'B00S'
    private BORDER_ORC_UP_RIGHT = 'B00T'

    private BORDER_UNDEAD_DOWN = 'B006'
    private BORDER_UNDEAD_UP = 'B009'
    private BORDER_UNDEAD_LEFT = 'B007'
    private BORDER_UNDEAD_RIGHT = 'B008'
    private BORDER_UNDEAD_DOWN_LEFT = 'B00U'
    private BORDER_UNDEAD_DOWN_RIGHT = 'B00V'
    private BORDER_UNDEAD_UP_LEFT = 'B00X'
    private BORDER_UNDEAD_UP_RIGHT = 'B00W'
}


// globals
    public rect AreaRect
    private fogmodifier Visibility
    private destructable BASE, BACKGROUND
    private destructable UP_RIGHT, UP_LEFT, DOWN_RIGHT, DOWN_LEFT
    private destructable array UP[22], DOWN[22], LEFT[10], RIGHT[10], MiscDestructables[300], MiscBackgrounds[125]
    private texttag array MiscText[100]
    private int DestrCount = 0, TextsCount = 0, BackgroundsCount = 0
    real Left_X, Left_Y
    public sound ClickSound, ActivateSound
    public bool IsShowed = false
    private timer CameraLockTimer = CT
    real BASE_X = -2368., BASE_Y = 2368.


    public void ResetCamera(){
        PT(CameraLockTimer)
    }

    private void CameraProcess(){
        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 1645., 0.)
        SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, 270., 0.)
        SetCameraField(CAMERA_FIELD_ROTATION, 90., 0.)
        PanCameraToTimed(BASE_X - 8., BASE_Y + 15., 0.)
    }

    public void ClearText(){
        while(TextsCount != 0){ DestroyTextTag(MiscText[TextsCount]); TextsCount-- }
    }

    public void ClearWindow(){
        while(DestrCount != 0){ RemoveDestructable(MiscDestructables[DestrCount]); DestrCount-- }
        while(TextsCount != 0){ DestroyTextTag(MiscText[TextsCount]); TextsCount-- }
        while(BackgroundsCount != 0){ RemoveDestructable(MiscBackgrounds[BackgroundsCount]); BackgroundsCount-- }
    }

    public void DestroyInterface(){
        int c = 22
            IsShowed = false
            RemoveDestructable(BASE)
            RemoveDestructable(BACKGROUND)
            FogModifierStop(Visibility)
            PT(CameraLockTimer)
            // UP
                while(c != 0) { RemoveDestructable(UP[c]); c-- }
            // DOWN
            c = 22
                while(c != 0) { RemoveDestructable(DOWN[c]); c-- }
            // RIGHT
            c = 10
                while(c != 0) { RemoveDestructable(RIGHT[c]); c-- }
            // LEFT
            c = 10
                while(c != 0) { RemoveDestructable(LEFT[c]); c-- }
            RemoveDestructable(UP_LEFT)
            RemoveDestructable(UP_RIGHT)
            RemoveDestructable(DOWN_LEFT)
            RemoveDestructable(DOWN_RIGHT)
                while(DestrCount != 0){ RemoveDestructable(MiscDestructables[DestrCount]); DestrCount-- }
                while(TextsCount != 0){ DestroyTextTag(MiscText[TextsCount]); TextsCount-- }
                while(BackgroundsCount != 0){ RemoveDestructable(MiscBackgrounds[BackgroundsCount]); BackgroundsCount-- }
    }

    public void TurnOnCamera(){
        TimerStart(CameraLockTimer, 0.01, true, function CameraProcess)
    }

    public void AddTextEx(real x, real y, string s, real size){
        TextsCount++
        MiscText[TextsCount] = CreateTextTag()
        SetTextTagText(MiscText[TextsCount], s, (size * 0.023) / 10.)
        SetTextTagPos(MiscText[TextsCount], x, y, 5.)
            //SetTextTagColor(MiscText[TextsCount], PercentToInt(1, 255), PercentToInt(g, 255), PercentToInt(b,255), 0)
    }

    public void AddText(int cell_x, int cell_y, string s, real r, real g, real b, real size){
        real true_x = (Left_X + cell_x * 64) + 32., true_y = (Left_Y + cell_y * 64) + 32.
            TextsCount++
            MiscText[TextsCount] = CreateTextTag()
            SetTextTagText(MiscText[TextsCount], s, (size * 0.023) / 10.)
            SetTextTagPos(MiscText[TextsCount], true_x, true_y, 5.)
            SetTextTagColor(MiscText[TextsCount], PercentToInt(r, 255), PercentToInt(g, 255), PercentToInt(b,255), 0)
    }

    public void AddBackground(int cell_x, int cell_y){
        real true_x = (Left_X + cell_x * 64) + 32., true_y = (Left_Y + cell_y * 64) + 32.
            BackgroundsCount++
            MiscBackgrounds[BackgroundsCount] = CreateDestructable(BACKGROUND_BLACK_ID, true_x, true_y, 0., 1.1, 0)
    }

    public void CreatePanel(int cell_x, int cell_y, int lenght, int width, int variation){
        int down_right, down_left, up_right, up_left, up, down, left, right
        //real start_x = BASE_X + Rx(715.547, -153.435), start_y = BASE_Y + Ry(715.547, -153.435)
        real true_x = (Left_X + cell_x * 64) + 32., true_y = (Left_Y + cell_y * 64) + 32.
        int l, w, c_x, c_y
            if (lenght == 0 or width == 0) { return }

                if variation == 1 {
                    down_right = BORDER_HUMAN_DOWN_RIGHT
                    down_left = BORDER_HUMAN_DOWN_LEFT
                    up_right = BORDER_HUMAN_UP_RIGHT
                    up_left = BORDER_HUMAN_UP_LEFT
                    up = BORDER_HUMAN_UP
                    down = BORDER_HUMAN_DOWN
                    left = BORDER_HUMAN_LEFT
                    right = BORDER_HUMAN_RIGHT
                }
                elseif variation == 2 {
                    down_right = BORDER_ORC_DOWN_RIGHT
                    down_left = BORDER_ORC_DOWN_LEFT
                    up_right = BORDER_ORC_UP_RIGHT
                    up_left = BORDER_ORC_UP_LEFT
                    up = BORDER_ORC_UP
                    down = BORDER_ORC_DOWN
                    left = BORDER_ORC_LEFT
                    right = BORDER_ORC_RIGHT
                }
                elseif variation == 3 {
                    down_right = BORDER_ELF_DOWN_RIGHT
                    down_left = BORDER_ELF_DOWN_LEFT
                    up_right = BORDER_ELF_UP_RIGHT
                    up_left = BORDER_ELF_UP_LEFT
                    up = BORDER_ELF_UP
                    down = BORDER_ELF_DOWN
                    left = BORDER_ELF_LEFT
                    right = BORDER_ELF_RIGHT
                }
                elseif variation == 4 {
                    down_right = BORDER_UNDEAD_DOWN_RIGHT
                    down_left = BORDER_UNDEAD_DOWN_LEFT
                    up_right = BORDER_UNDEAD_UP_RIGHT
                    up_left = BORDER_UNDEAD_UP_LEFT
                    up = BORDER_UNDEAD_UP
                    down = BORDER_UNDEAD_DOWN
                    left = BORDER_UNDEAD_LEFT
                    right = BORDER_UNDEAD_RIGHT
                }

            if (lenght == 1 and width == 1){
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_left, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_right, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_left, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_right, true_x, true_y, 0., 0.65, 0)

            }
            elseif (lenght == 1 and width > 1){
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_left, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_right, true_x, true_y, 0., 0.65, 0)
                    while(width > 1){
                        cell_y--
                        true_y = (Left_Y + cell_y * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(left, true_x, true_y, 0., 0.65, 0)
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(right, true_x, true_y, 0., 0.65, 0)
                        width--
                    }
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_left, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_right, true_x, true_y, 0., 0.65, 0)
            }
            elseif (lenght > 1 and width == 1){
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_left, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_left, true_x, true_y, 0., 0.65, 0)
                    while(lenght > 1){
                        cell_x++
                        true_x = (Left_X + cell_x * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(up, true_x, true_y, 0., 0.65, 0)
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(down, true_x, true_y, 0., 0.65, 0)
                        lenght--
                    }
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_right, true_x, true_y, 0., 0.65, 0)
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_right, true_x, true_y, 0., 0.65, 0)
            }
            elseif (lenght > 1 and width > 1){
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_left, true_x, true_y, 0., 0.65, 0)
                // + velocity in right
                l = lenght; c_x = cell_x
                    while(l > 1){
                        c_x++
                        true_x = (Left_X + c_x * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(up, true_x, true_y, 0., 0.65, 0)
                        l--
                    }
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(up_right, true_x, true_y, 0., 0.65, 0)
                //========================================================================
                // + velocity in down
                w = width; c_y = cell_y
                    while(w > 1){
                        c_y--
                        true_y = (Left_Y + c_y * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(right, true_x, true_y, 0., 0.65, 0)
                        w--
                    }
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_right, true_x, true_y, 0., 0.65, 0)
                //========================================================================
                // - velocity in down
                true_x = (Left_X + cell_x * 64) + 32.
                w = width; c_y = cell_y
                    while(w > 1){
                        c_y--
                        true_y = (Left_Y + c_y * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(left, true_x, true_y, 0., 0.65, 0)
                        w--
                    }
                DestrCount++
                MiscDestructables[DestrCount] = CreateDestructable(down_left, true_x, true_y, 0., 0.65, 0)
                //========================================================================
                // - velocity in right
                true_x = (Left_X + cell_x * 64) + 32.
                l = lenght; c_x = cell_x
                    while(l > 1){
                        c_x++
                        true_x = (Left_X + c_x * 64) + 32.
                        DestrCount++
                        MiscDestructables[DestrCount] = CreateDestructable(down, true_x, true_y, 0., 0.65, 0)
                        l--
                    }
            }
            //CreateDestructable('B000', (start_x + cell_x * 64) + 32.,(start_y + cell_y * 64) + 32., 0., 1.1, 0)
    }

    public void BuildInterface(int variation){
        int background, down_right, down_left, up_right, up_left, up, down, left, right
        int c = 22
        real x, y, a, dist = 64.
                if IsShowed { return }
                else { IsShowed = true }

            SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, 270., 0.)
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 1645., 0.)
            TimerStart(CameraLockTimer, 0.01, true, function CameraProcess)
                if variation == 1 {
                    background = BACKGROUND_HUMAN_ID
                    down_right = BORDER_HUMAN_DOWN_RIGHT
                    down_left = BORDER_HUMAN_DOWN_LEFT
                    up_right = BORDER_HUMAN_UP_RIGHT
                    up_left = BORDER_HUMAN_UP_LEFT
                    up = BORDER_HUMAN_UP
                    down = BORDER_HUMAN_DOWN
                    left = BORDER_HUMAN_LEFT
                    right = BORDER_HUMAN_RIGHT
                }
                elseif variation == 2 {
                    background = BACKGROUND_ORC_ID
                    down_right = BORDER_ORC_DOWN_RIGHT
                    down_left = BORDER_ORC_DOWN_LEFT
                    up_right = BORDER_ORC_UP_RIGHT
                    up_left = BORDER_ORC_UP_LEFT
                    up = BORDER_ORC_UP
                    down = BORDER_ORC_DOWN
                    left = BORDER_ORC_LEFT
                    right = BORDER_ORC_RIGHT
                }
                elseif variation == 3 {
                    background = BACKGROUND_ELF_ID
                    down_right = BORDER_ELF_DOWN_RIGHT
                    down_left = BORDER_ELF_DOWN_LEFT
                    up_right = BORDER_ELF_UP_RIGHT
                    up_left = BORDER_ELF_UP_LEFT
                    up = BORDER_ELF_UP
                    down = BORDER_ELF_DOWN
                    left = BORDER_ELF_LEFT
                    right = BORDER_ELF_RIGHT
                }
                elseif variation == 4 {
                    background = BACKGROUND_UNDEAD_ID
                    down_right = BORDER_UNDEAD_DOWN_RIGHT
                    down_left = BORDER_UNDEAD_DOWN_LEFT
                    up_right = BORDER_UNDEAD_UP_RIGHT
                    up_left = BORDER_UNDEAD_UP_LEFT
                    up = BORDER_UNDEAD_UP
                    down = BORDER_UNDEAD_DOWN
                    left = BORDER_UNDEAD_LEFT
                    right = BORDER_UNDEAD_RIGHT
                }
            BASE = CreateDestructable(BASE_ID, BASE_X, BASE_Y, 90., 6.5, 0)
            BACKGROUND = CreateDestructable(background, BASE_X + 32., BASE_Y, 0., 2., 0)
            FogModifierStart(Visibility)
            // UP
            // x = BASE_X + Rx(746.374, 149.036); y = BASE_Y + Ry(746.374, 149.036)
            x = BASE_X + Rx(801.921, 151.390); y = BASE_Y + Ry(801.921, 151.390)
                while(c != 0) {
                    UP[c] = CreateDestructable(up, x + Rx(dist, 0.), y + Ry(dist, 0.), 0., 0.65, 0)
                    dist += 64.
                    c--
                }
            // DOWN
            // x = BASE_X + Rx(715.547, -153.435); y = BASE_Y + Ry(715.547, -153.435)
            x = BASE_X + Rx(773.327, -155.556); y = BASE_Y + Ry(773.327, -155.556)
            c = 22; dist = 64.
                while(c != 0) {
                    DOWN[c] = CreateDestructable(down, x + Rx(dist, 0.), y + Ry(dist, 0.), 0., 0.65, 0)
                    dist += 64.
                    c--
                }
            // RIGHT
            x = BASE_X + Rx(858.656, 26.565); y = BASE_Y + Ry(858.656, 26.565)
            c = 10; dist = 64.
                while(c != 0) {
                    RIGHT[c] = CreateDestructable(right, x + Rx(dist, -90.), y + Ry(dist, -90.), 0., 0.65, 0)
                    dist += 64.
                    c--
                }
            // LEFT
            x = BASE_X + Rx(801.921, 151.390); y = BASE_Y + Ry(801.921, 151.390)
            c = 10; dist = 64.
                while(c != 0) {
                    LEFT[c] = CreateDestructable(left, x + Rx(dist, -90.), y + Ry(dist, -90.), 0., 0.65, 0)
                    dist += 64.
                    c--
                }
        UP_LEFT = CreateDestructable(up_left, BASE_X + Rx(801.921, 151.390), BASE_Y + Ry(801.921, 151.390), 0., 0.65, 0)
        UP_RIGHT = CreateDestructable(up_right, BASE_X + Rx(858.656, 26.565), BASE_Y + Ry(858.656, 26.565), 0., 0.65, 0)
        DOWN_LEFT = CreateDestructable(down_left, BASE_X + Rx(773.327, -155.556), BASE_Y + Ry(773.327, -155.556), 0., 0.65, 0)
        DOWN_RIGHT = CreateDestructable(down_right, BASE_X + Rx(832.015, -22.620), BASE_Y + Ry(832.015, -22.620), 0., 0.65, 0)
    }

    private void InitBasePos(){
        if GetDestructableTypeId(GetEnumDestructable()) == BASE_ID {
            BASE_X = GetDestructableX(GetEnumDestructable())
            BASE_Y = GetDestructableY(GetEnumDestructable())
            RemoveDestructable(GetEnumDestructable())
        }
    }

    private void DelayedInit(){
        Left_X = BASE_X + Rx(773.327, -155.556); Left_Y = BASE_Y + Ry(773.327, -155.556)
        ClickSound = CreateSound("Sound\\Interface\\MouseClick1.wav", false, false, false , 10, 10, "CombatSoundsEAX")
        ActivateSound = CreateSound("Sound\\Interface\\AutoCastButtonClick1.wav", false, false, false, 10, 10, "CombatSoundsEAX")
        AreaRect = Rect(BASE_X - 768., BASE_Y - 512., BASE_X + 922., BASE_Y + 512.)
        Visibility = CreateFogModifierRect(Player(0), FOG_OF_WAR_VISIBLE, AreaRect, true, false)
        FogModifierStop(Visibility)
        DT(GetExpiredTimer())
    }

    private void Init(){
        EnumDestructablesInRect(bj_mapInitialPlayableArea, null, function InitBasePos)
        TimerStart(CT, 0.1, false, function DelayedInit)
    }

endlibrary