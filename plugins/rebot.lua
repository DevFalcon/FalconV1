-- تـم التعديـل والتعريب بواسطه @Sudo_Sky
-- replay.lua
do

local function Falcon(msg, matches)
if matches[1]=="احبك" then
return  "*نـيهم حبعمري😍❤*"
elseif matches[1]=="هلو" then 
return  "*هلاوات اسـم الله🌚💔*"
elseif matches[1]=="السلام عليكم" then 
return  "*وعليكـم مولاي🌚💔*"
elseif matches[1]=="الحمدلله" or matches[1]== "الحمد لله" then 
return  "*دوم حبعـمري🌚💋*"
elseif matches[1]=="مرحبا" then 
return  "*مراحب حيـاتي🌚❤️*"
elseif matches[1]=="هاي" then 
return  "*وينـهة🌚😂*"
elseif matches[1]=="شلونكم" then 
return  "*مادري🌚*"
elseif matches[1]=="بوت" then 
return  "*كـول فالكـون مو بـوت يـول🌚📍*" 
elseif matches[1]=="هلاو" then 
return  "*ادري🌚*"
elseif matches[1]=="رابط حذف" then 
return  "*• ﺣٍذفَ ﯛصيړ ڪَډ ڪﻟمټك ۿٖٱكِ 😺🥀* \n https://telegram.org/deactivate"
elseif matches[1]=="جاو" then 
return  "*تريـله بـلا رقـم👋🏻🌚*"
elseif matches[1]=="باي" then 
return  "*تريـله بـلا رقـم👋🏻🌚*"
elseif matches[1]=="اعشقك" then 
return  "*يولـــــــد هـذا معوز حنان😔😂*"
elseif matches[1]=="شخباركم" then 
return  "*مادري🌚*"
elseif matches[1]=="مطور" then 
return  "*هـذا 👉🏻* @Sudo_Sky"
elseif matches[1]=="تمام" then 
return  "*دوم حيـاتي🌚*"
elseif matches[1]=="فالكون" then
return  "*كـول حمـبي🌚❤️*"
elseif matches[1]=="مرتضى" then
return  "*يمه فديتـه مطـوري😻❤️*"
elseif matches[1]=="مهند" then
return  "*يمه فديتـه مطـوري😻❤️*"
elseif matches[1]=="😒" then
return "*اسم الله🌚*"
elseif matches[1]=="😂" then
return "*اسـم الله شهالفلم الرعب🌚😂*"
end
-----------------{ملف انجب}----------------
if matches[1]=="انجب" and is_sudo (msg) then
return "*صـار حياتي المطور🌚❤️*"
elseif matches[1]=="انجب" and is_owner (msg) then
return "*لخـاطر المطـور راح احترمك🌚💔*"
elseif matches[1]=="انجب" and is_mod (msg) then
return "*دمشي دنبك كلك واسطات صعدوك ادمن🌚💔*"
elseif matches[1]=="انجب" then
return "*لك هم عضو وتشمر ديييي🌚💔*"
end
----------------{ملف موقعي}--------------
if matches[1]=="موقعي" and is_sudo (msg) then
return "*انت مطـور البـوت حياتي🌚❤️*"
elseif matches[1]=="موقعي" and is_admin (msg) then
return "*انت اخويـه المشـرف🌚*"
elseif matches[1]=="موقعي" and is_owner (msg) then
return "*انت ابن عمي المديـر🌚💋*"
elseif matches[1]=="موقعي" and is_mod (msg) then
return "*انت صديـقي الادمـن🌚*" 
elseif matches[1]=="موقعي" then
return "*انت عضـو مهتلف🌚😂*"
end
----------------{ملف المطـور}-----------------
if matches[1]=="المطور" then
return "*• ԲΔⅬႺOΠ 💥🤖 ❳⟯*\nᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ𖤍ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ\n* • مۘطۄړېڼ ٱلَبِۅټ ✔️*\n*👁‍🗨 • DEV ┇* [@Sudo_Sky] \n*👁‍🗨 • DEV ┇* [@iS0Si]\n*👁‍🗨 • TWS┇* [ @XxMTxX_bot ] \nᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ𖤍ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ\n*• ℂℍ* [ @Team_Advisor ] ۦ.💛"






end
end
return {
  patterns = {
  "^(احبك)$",
"^(هلو)$",
"^(الحمدلله)$",
"^(الحمد لله)$",
"^(مرحبا)$",
"^(هاي)$",
"^(شلونكم)$",
"^(بوت)$",
"^(هلاو)$",
"^(رابط حذف)$",
"^(جاو)$",
"^(باي)$",
"^(فالكون)$",
"^(اعشقك)$",
"^(شخباركم)$",
"^(مطور)$",
"^(تمام)$",
"^(انجب)$",
"^(انجب)$",
"^(انجب)$",
"^(انجب)$",
"^(موقعي)$",
"^(موقعي)$",
"^(موقعي)$",
"^(موقعي)$",
"^(موقعي)$",
"^(😒)$",
"^(😂)$",
"^(مهند)$",
"^(مرتضى)$",
"^(المطور)$",
    },
  run = Falcon
}
end

-- تـم التعديـل والتعريب بواسطه @Sudo_Sky
-- replay.lua
