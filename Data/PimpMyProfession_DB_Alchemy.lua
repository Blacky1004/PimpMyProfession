--
-- Created by IntelliJ IDEA.
-- User: Jens
-- Date: 25.03.14
-- Time: 15:15
-- To change this template use File | Settings | File Templates.
--
local L = LibStub("AceLocale-3.0"):GetLocale("PimpMyProfession")

PimpMyProfession.PmpDBAlchNeeds = {
    pid = 171,
    shoplist =
    {
        {
            plevel = {L["Apprentice"],1,75},
            needs = {
                [1] = {
                    item = 2450,
                    count = 20
                },
                [2] = {
                    item =  765,
                    count = 54
                },
                [3] = {
                    item = 2447,
                    count = 54
                },
                [4] = {
                    item = 3371,
                    count=54
                }
            }
        },
        {
            plevel = {L["Journeyman"],75,150},
            needs = {
                [1] = {3355,5},
                [2] = {3820,15},
                [3] = {2453,25},
                [4] = {785,30},
                [5] = {3371,60},
                [6] = {2450,82},
                [7] = {118,17}
            }
        },
        {
            plevel = {L["Expert"],150,225},
            needs = {
                [1] = {3818,10},
                [2] = {8838,10},
                [3] = {3355,15},
                [4] = {3358,20},
                [5] = {3357,20},
                [6] = {3356,20},
                [7] = {3820,25},
                [8] = {3821,30},
                [9] = {3371,75}
            }
        },
        {
            plevel = {L["Artisan"],225,300},
            needs = {
                [1] = {3821,10},
                [2] = {8846,10},
                [3] = {13465,25},
                [4] = {8839,30},
                [5] = {13464,30},
                [6] = {13463,30},
                [7] = {3358,26},
                [8] = {8838,66},
                [9] = {3371,81}
            }
        },
        {
            plevel = {L["Master"],300,375},
            needs = {
                [1] = {22791,10},
                [2] = {36907,10},
                [3] = {36904,10},
                [4] = {22787,20},
                [5] = {13464,25},
                [6] = {22786,30},
                [7] = {36901,30},
                [8] = {22785,30},
                [9] = {3371,75}
            }
        },
        {
            plevel = {L["Grand Master"],375,450},
            needs = {
                [1] = {36907,10},
                [2] = {36904,17},
                [3] = {52983,29},
                [4] = {36901,32},
                [5] = {36906,90},
                [6] = {3371,96}
            }
        },
        {
            plevel = {L["Illustrious"],450,525},
            needs = {
                [1] = {52988,5},
                [2] = {52987,10},
                [3] = {52984,20},
                [4] = {52986,20},
                [5] = {52985,17},
                [6] = {72234,30},
                [7] = {52983,32},
                [8] = {3371,82}
            }
        },
        {
            plevel = {L["Zen Master"],525,600},
            needs = {
                info={L["Alch Zen Master Info"]}
            }
        }
    }
}
--Format: von,bis,item,spell
PimpMyProfession.PmpDbAlchRecipes = {
    {
        f=1, t=75,
        skills = {
             {1,55,54,118,2330},
             {55,75,20,858,2337}
        }
    },
    {
        f=75,t=150,
        skills= {
            {75,90,17,858,2337},
            {90,110,20,3383,3171},
            {110,135,25,929,3447},
            {135,145,10,3385,3173},
            {145,150,5,3389,3177}
        }
    },
    {
        f=150,t=225,
        skills = {
            {150,155,5,3389,3177},
            {155,175,20,1710,7181},
            {175,185,10,3823,3448},
            {185,205,20,8949,11449},
            {205,215,10,6149,11448},
            {215,225,10,3928,11457}
        }
    },
    {
        f=225,t=300,
        skills = {
            {225,245,26,3928,11457},
            {245,255,10,9187,11467},
            {255,260,5,9233,11478},
            {260,275,15,13443,17553},
            {275,290,15,13446,17556},
            {290,300,10,13454,17573}
        }
    },
    {
        f=300,t=375,
        skills = {
            {300,315,15,28100,33732},
            {315,325,10,22825,28545},
            {325,335,10,34440,45061},
            {335,340,5,22829,28551},
            {340,350,10,22832,28555},
            {350,360,10,39671,53838},
            {360,365,5,40067,53839},
            {365,375,10,40070,53842}
        }
    },
    {
        f=375,t=450,
        skills = {
            {375,380,7,40070,53842},
            {380,385,5,40081,53900},
            {385,390,5,40073,54218},
            {390,395,5,40078,53898},
            {395,415,20,40093,53905},
            {415,422,10,40093,53905},
            {422,425,15,40093,53905},
            {425,450,29,67415,93935}
        }
    }
}

PmpDbAlchOptionals = {
    {13443,13477}
}

