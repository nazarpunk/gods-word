library CraftsButtonsDatabase initializer Init

define {
    CBD = 60 // не забывай увеличивать это кол-во при добавлении новых навыков! та же штука со скилами
}

enum (crafts_database) { CRAFTS_NONE, FIGHTING_C, ALCHEMY_C, COOKING_C, BLACKSMITHING_C, FARMING_C, HUNTERING_C, BRIGANDAGE_C, SEWING_C, ENGINEERING_C, JEWERLY_C, MAGIC_C, ORATORY_C,L_C, MISC_C DOWN_BUTTON, UP_BUTTON }

// globals
    int array CraftsButtonId[CBD]
    int array CraftsIcon[CBD]
    int array CraftsCategory[CBD]
    int array CraftsLevel[CBD]
    string array CraftsName[CBD]
    string array CraftsDescription[CBD][14]
    int Crafts_lastFinded = 0


    int GetCraftsButtonCell(int id){
        int c = -1
            while(c++ < CBD)  { if CraftsButtonId[c] == id { Crafts_lastFinded = c; return c } }
        return 0
    }

    private void Init(){
        int c = 0
        //==========================
            CraftsButtonId[c] = 0
            CraftsIcon[c] = 0
            c++
        //==========================
            CraftsButtonId[c] = FIGHTING_C
            CraftsIcon[c] = 'B02X'
            c++
        //==========================
            CraftsButtonId[c] = ALCHEMY_C
            CraftsIcon[c] = 'B02Y'
            c++
        //==========================
            CraftsButtonId[c] = ENGINEERING_C
            CraftsIcon[c] = 'B02Z'
            c++
        //==========================
            CraftsButtonId[c] = ORATORY_C
            CraftsIcon[c] = 'B030'
            c++
        //==========================
            CraftsButtonId[c] = BLACKSMITHING_C
            CraftsIcon[c] = 'B031'
            c++
        //==========================
            CraftsButtonId[c] = COOKING_C
            CraftsIcon[c] = 'B032'
            c++
        //==========================
            CraftsButtonId[c] = HUNTERING_C
            CraftsIcon[c] = 'B033'
            c++
        //==========================
            CraftsButtonId[c] = BRIGANDAGE_C
            CraftsIcon[c] = 'B034'
            c++
        //==========================
            CraftsButtonId[c] = MAGIC_C
            CraftsIcon[c] = 'B035'
            c++
        //==========================
            CraftsButtonId[c] = FARMING_C
            CraftsIcon[c] = 'B036'
            c++
        //==========================
            CraftsButtonId[c] = SEWING_C
            CraftsIcon[c] = 'B037'
            c++
        //==========================
            CraftsButtonId[c] = JEWERLY_C
            CraftsIcon[c] = 'B038'
            c++
        //==========================
            CraftsButtonId[c] = L_C
            CraftsIcon[c] = 'B03A'
            c++
        //==========================
            CraftsButtonId[c] = MISC_C
            CraftsIcon[c] = 'B03B'
            c++
        //==========================
            CraftsButtonId[c] = DOWN_BUTTON
            CraftsIcon[c] = 'B029'
            c++
        //==========================
            CraftsButtonId[c] = UP_BUTTON
            CraftsIcon[c] = 'B02A'
            c++
        //==========================
            CraftsButtonId[c] = 'A00A'
            CraftsIcon[c] = 'B039'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 1
			CraftsName[c] = "Одноручное оружие"
            CraftsDescription[c][1] = "Одноручное оружие"
            CraftsDescription[c][2] = "Владение одноручным оружием."
            c++
        //==========================
            CraftsButtonId[c] = 'A01A'
            CraftsIcon[c] = 'B03C'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Парирование щитом"
            CraftsDescription[c][1] = "Парирование щитом"
            CraftsDescription[c][2] = "Умение обращаться со щитом."
            c++
        //==========================
            CraftsButtonId[c] = 'A02A'
            CraftsIcon[c] = 'B03D'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Тяжёлое оружие"
            CraftsDescription[c][1] = "Тяжёлое оружие"
            CraftsDescription[c][2] = "Умение обращаться с молотами, "
			CraftsDescription[c][3] = "топорами, тяжёлыми дубинами."
            c++
        //==========================
			CraftsButtonId[c] = 'A03A'
            CraftsIcon[c] = 'B03E'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Магические посохи"
            CraftsDescription[c][1] = "Магические посохи"
            CraftsDescription[c][2] = "Умение обращаться с магическими посохами."
            c++
        //==========================
			CraftsButtonId[c] = 'A04A'
            CraftsIcon[c] = 'B03F'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Древковое оружие"
            CraftsDescription[c][1] = "Древковое оружие"
            CraftsDescription[c][2] = "Умение обращаться с посохами, копьями, пиками."
            c++
        //==========================
			CraftsButtonId[c] = 'A05A'
            CraftsIcon[c] = 'B03G'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Тяжёлые доспехи"
            CraftsDescription[c][1] = "Тяжёлые доспехи"
            CraftsDescription[c][2] = "Умение носить тяжёлые доспехи."
            c++
        //==========================
			CraftsButtonId[c] = 'A06A'
            CraftsIcon[c] = 'B03H'
            CraftsCategory[c] = FIGHTING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Лёгкие доспехи"
            CraftsDescription[c][1] = "Лёгкие доспехи"
            CraftsDescription[c][2] = "Умение носить лёгкие доспехи."
            c++
        //==========================
			CraftsButtonId[c] = 'A01L'
            CraftsIcon[c] = 'B03I'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 1
			CraftsName[c] = "Травничество"
            CraftsDescription[c][1] = "Травничество"
            CraftsDescription[c][2] = "Способность собирать растения."
            c++
        //==========================
			CraftsButtonId[c] = 'A02L'
            CraftsIcon[c] = 'B03J'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Варка зелий здоровья"
            CraftsDescription[c][1] = "Варка зелий здоровья"
            CraftsDescription[c][2] = "Способность варить лечебные зелья."
            c++
        //==========================
			CraftsButtonId[c] = 'A03L'
            CraftsIcon[c] = 'B03K'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Варка зелий маны"
            CraftsDescription[c][1] = "Варка зелий маны"
            CraftsDescription[c][2] = "Способность варить зелья маны."
            c++
        //==========================
			CraftsButtonId[c] = 'A04L'
            CraftsIcon[c] = 'B03L'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Варка особых зелий"
            CraftsDescription[c][1] = "Варка особых зелий"
            CraftsDescription[c][2] = "Способность варить особые зелья."
            c++
        //==========================
			CraftsButtonId[c] = 'A05L'
            CraftsIcon[c] = 'B03M'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Варка постоянных зелий"
            CraftsDescription[c][1] = "Варка постоянных зелий"
            CraftsDescription[c][2] = "Способность варить постоянные зелья."
            c++
        //==========================
			CraftsButtonId[c] = 'A06L'
            CraftsIcon[c] = 'B03N'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Смешивание"
            CraftsDescription[c][1] = "Смешивание"
            CraftsDescription[c][2] = "Способность смешивать зелья."
            c++
        //==========================
			CraftsButtonId[c] = 'A07L'
            CraftsIcon[c] = 'B044'
            CraftsCategory[c] = ALCHEMY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Приготовление ядов"
            CraftsDescription[c][1] = "Приготовление ядов"
            CraftsDescription[c][2] = "Способность изготавливать яды."
            c++
        //==========================
			CraftsButtonId[c] = 'B01R'
            CraftsIcon[c] = 'B03P'
            CraftsCategory[c] = BRIGANDAGE_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Карманное воровство"
            CraftsDescription[c][1] = "Карманное воровство"
            CraftsDescription[c][2] = "Возможность воровать у персонажей."
            c++
        //==========================
			CraftsButtonId[c] = 'B02R'
            CraftsIcon[c] = 'B03O'
            CraftsCategory[c] = BRIGANDAGE_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Взлом замков"
            CraftsDescription[c][1] = "Взлом замков"
            CraftsDescription[c][2] = "Возможность взламывать замки "
			CraftsDescription[c][3] = "с помощью отмычки."
            c++
        //==========================
			CraftsButtonId[c] = 'B03R'
            CraftsIcon[c] = 'B03Q'
            CraftsCategory[c] = BRIGANDAGE_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Марадёрство"
            CraftsDescription[c][1] = "Марадёрство"
            CraftsDescription[c][2] = "Возможность вскрывать могилы."
            c++
        //==========================
			CraftsButtonId[c] = 'O01R'
            CraftsIcon[c] = 'B03R'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Лесть"
            CraftsDescription[c][1] = "Лесть"
            CraftsDescription[c][2] = "Способность подлизываться к собеседнику."
            c++
        //==========================
			CraftsButtonId[c] = 'O02R'
            CraftsIcon[c] = 'B03S'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Ложь"
            CraftsDescription[c][1] = "Ложь"
            CraftsDescription[c][2] = "Умение врать."
            c++
        //==========================
			CraftsButtonId[c] = 'O03R'
            CraftsIcon[c] = 'B03T'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Подкуп"
            CraftsDescription[c][1] = "Подкуп"
            CraftsDescription[c][2] = "Коррупция всегда помогает преступникам."
            c++
        //==========================
			CraftsButtonId[c] = 'O04R'
            CraftsIcon[c] = 'B03U'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Убеждение"
            CraftsDescription[c][1] = "Убеждение"
            CraftsDescription[c][2] = "Искусство убеждать."
            c++
        //==========================
			CraftsButtonId[c] = 'O05R'
            CraftsIcon[c] = 'B03V'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Угрозы"
            CraftsDescription[c][1] = "Угрозы"
            CraftsDescription[c][2] = "Умение запугивать собеседника."
            c++
        //==========================
			CraftsButtonId[c] = 'O06R'
            CraftsIcon[c] = 'B03W'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Феня"
            CraftsDescription[c][1] = "Феня"
            CraftsDescription[c][2] = "Воровской жаргон. Поможет вам найти"
			CraftsDescription[c][3] = "общий язык с преступниками."
            c++
        //==========================
			CraftsButtonId[c] = 'O07R'
            CraftsIcon[c] = 'B03X'
            CraftsCategory[c] = ORATORY_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Шутка"
            CraftsDescription[c][1] = "Шутка"
            CraftsDescription[c][2] = "Добрая шутка поможет разрядить обстановку."
            c++
        //==========================
			CraftsButtonId[c] = 'B01S'
            CraftsIcon[c] = 'B03Y'
            CraftsCategory[c] = BLACKSMITHING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Заточка оружия"
            CraftsDescription[c][1] = "Заточка оружия"
            CraftsDescription[c][2] = "Увеличивает урон от оружия на 50%."
            c++
        //==========================
			CraftsButtonId[c] = 'F01F'
            CraftsIcon[c] = 'B03Z'
            CraftsCategory[c] = FARMING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Бортничество"
            CraftsDescription[c][1] = "Бортничество"
            CraftsDescription[c][2] = "Способность добывать мёд."
            c++
        //==========================
			CraftsButtonId[c] = 'F02F'
            CraftsIcon[c] = 'B040'
            CraftsCategory[c] = FARMING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Доение скота"
            CraftsDescription[c][1] = "Доение скота"
            CraftsDescription[c][2] = "Способность доить коров и других молочных животных."
            c++
        //==========================
			CraftsButtonId[c] = 'F03F'
            CraftsIcon[c] = 'B043'
            CraftsCategory[c] = FARMING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Посадка"
            CraftsDescription[c][1] = "Посадка"
            CraftsDescription[c][2] = "Способность садить культурные растения."
            c++
        //==========================
			CraftsButtonId[c] = 'F04F'
            CraftsIcon[c] = 'B041'
            CraftsCategory[c] = FARMING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Прополка"
            CraftsDescription[c][1] = "Прополка"
            CraftsDescription[c][2] = "Способнось удалять сорняки."
            c++
        //==========================
			CraftsButtonId[c] = 'F05F'
            CraftsIcon[c] = 'B042'
            CraftsCategory[c] = FARMING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Сбор урожая"
            CraftsDescription[c][1] = "Сбор урожая"
            CraftsDescription[c][2] = "Выучив эту способность вы"
			CraftsDescription[c][3] = "сможете правильно собирать урожай."
            c++
        //==========================
			CraftsButtonId[c] = 'C01C'
            CraftsIcon[c] = 'B045'
            CraftsCategory[c] = COOKING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Выпечка"
            CraftsDescription[c][1] = "Выпечка"
            CraftsDescription[c][2] = "Возможность печь мучные изделия."
            c++
        //==========================
			CraftsButtonId[c] = 'C02C'
            CraftsIcon[c] = 'B046'
            CraftsCategory[c] = COOKING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Жарка"
            CraftsDescription[c][1] = "Жарка"
            CraftsDescription[c][2] = "Возможность жарить пищу."
            c++
        //==========================
			CraftsButtonId[c] = 'C03C'
            CraftsIcon[c] = 'B047'
            CraftsCategory[c] = COOKING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Самогоноварение"
            CraftsDescription[c][1] = "Самогоноварение"
            CraftsDescription[c][2] = "Возможность гнать алкогольные напитки."
            c++
        //==========================
			CraftsButtonId[c] = 'H01H'
            CraftsIcon[c] = 'B048'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Владение луком"
            CraftsDescription[c][1] = "Владение луком"
            CraftsDescription[c][2] = "Умение стрелять из лука."
            c++
        //==========================
			CraftsButtonId[c] = 'H02H'
            CraftsIcon[c] = 'B049'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Добыча трофеев"
            CraftsDescription[c][1] = "Добыча трофеев"
            CraftsDescription[c][2] = "Умение добывать:  "
			CraftsDescription[c][3] = "- шкуры животных (1 уровень) "
			CraftsDescription[c][4] = "- шкуры рептилий (2 уровень) "
			CraftsDescription[c][5] = "- рога, клыки, когти (3 уровень) "
			CraftsDescription[c][6] = "- органы (4 уровень) "
			CraftsDescription[c][7] = "- яды (5 уровень) "
            c++
        //==========================
			CraftsButtonId[c] = 'H03H'
            CraftsIcon[c] = 'B04A'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Добыча мяса"
            CraftsDescription[c][1] = "Добыча мяса"
            CraftsDescription[c][2] = "Умение добывать мясо."
            c++
        //==========================
			CraftsButtonId[c] = 'H04H'
            CraftsIcon[c] = 'B04B'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Использование ловушек"
            CraftsDescription[c][1] = "Использование ловушек"
            CraftsDescription[c][2] = "Умение применять капканы,"
			CraftsDescription[c][3] = "сети и прочие ловушки."
            c++
        //==========================
			CraftsButtonId[c] = 'H05H'
            CraftsIcon[c] = 'B04C'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Разведение костров"
            CraftsDescription[c][1] = "Разведение костров"
            CraftsDescription[c][2] = "Время жизни костра = "
			CraftsDescription[c][3] = "уровень способности * 20."
            c++
        //==========================
			CraftsButtonId[c] = 'H06H'
            CraftsIcon[c] = 'B04D'
            CraftsCategory[c] = HUNTERING_C
			CraftsLevel[c] = 0
			CraftsName[c] = "Рыбалка"
            CraftsDescription[c][1] = "Рыбалка"
            CraftsDescription[c][2] = "Возможность ловить рыбу."
            c++
        //==========================
    }

endlibrary