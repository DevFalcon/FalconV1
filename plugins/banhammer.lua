-- تـم التعديـل والتعريب بواسطه @Sudo_Sky
--banhammer.lua
local function Falcon(msg, matches)
local data = load_data(_config.moderation.data)
----------------طرد بالرد----------------
if matches[1] == 'طرد' and is_mod(msg) then
   if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډې 🐸😹*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډ ٺـآج ړآسِڱ*"
    else
	kick_user(msg.reply.id, msg.to.id) 
 end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
	local User = resolve_username(matches[2]).information
if tonumber(User.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډې 🐸😹*"
    end
if is_mod1(msg.to.id, User.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډ ٺـآج ړآسِڱ*"
     else
	kick_user(User.id, msg.to.id) 
  end
   elseif matches[2] and string.match(matches[2], '^%d+$') then
if tonumber(matches[2]) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډې 🐸😹*"
    end
if is_mod1(msg.to.id, tonumber(matches[2])) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ طَړډ ٺـآج ړآسِڱ*"
   else
     kick_user(tonumber(matches[2]), msg.to.id) 
        end
     end
   end 

---------------حظر بالرد-------------------      
                   
if matches[1] == 'حظر' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړې*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړ ٺـآج ړآسِڱ*"
    end
  if is_banned(msg.reply.id, msg.to.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ﺣظړ آݪعٖضَـﯛ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
ban_user((""..(msg.reply.id)), msg.reply.id, msg.to.id)
     kick_user(msg.reply.id, msg.to.id) 
    return "*👁‍🗨| ټـم ﺣظړ آݪعٖضَـﯛ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
     end
   end

---------------الغاء حظر-------------------                         

if matches[1] == 'الغاء حظر' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| آڹـآ ـۧلاٰ آﻧﺣظَړ 🐸😹*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړ ٺـآج ړآسِڱ*"
    end
  if not is_banned(msg.reply.id, msg.to.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ٱﻟﻐـآ۽ ٱݪـِﺣظَړ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
unban_user(msg.reply.id, msg.to.id)
    return "*👁‍🗨| ټـم ٱﻟﻐـآ۽ ٱݪـِﺣظَړ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
     end
   end

------------------------كتم بالرد-------------------------------------

if matches[1] == 'كتم' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ڪُټمۘې 🐸😹*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ڪټمً ٺـآج ړآسِڱ*"
    end
  if is_silent_user(msg.reply.id, msg.to.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ڪټمَ آݪعٖضَـﯛ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
silent_user((""..(msg.reply.id)), msg.reply.id, msg.to.id)
    return "*👁‍🗨| ټـم ڪټمَ آݪعٖضَـﯛ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
     end
   end

------------------------الغاء كتم----------------------------
if matches[1] == 'الغاء كتم' and is_mod(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| آڹـآ ـۧلاٰ آﻧڪِټمَ 🐸😹*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ڪټمً ٺـآج ړآسِڱ*️"
    end
  if not is_silent_user(msg.reply.id, msg.to.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ٱﻟﻐـآ۽ ٱݪـِڪټمَ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
unsilent_user(msg.reply.id, msg.to.id)
    return "*👁‍🗨| ټـم ٱﻟﻐـآ۽ ٱݪـِڪټمَ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
     end
   end
-------------------------gban-------------------------------------
                   
if matches[1] == 'حظر عام' and is_admin(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړې 🐸😹*"
    end
if is_admin1(msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړ ٺـآج ړآسِڱ*"
    end
  if is_gbanned(msg.reply.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ﺣظړۿٖ عْآمٰ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
banall_user( msg.reply.id)
     kick_user(msg.reply.id, msg.to.id) 
    return "*👁‍🗨| ټـم ﺣظړۿٖ عْآمٰ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
     end
   end
--------------------------ungban-------------------------

if matches[1] == 'الغاء عام' and is_admin(msg) then
if msg.reply_id then
if tonumber(msg.reply.id) == tonumber(our_id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړې 🐸😹*"
    end
if is_mod1(msg.to.id, msg.reply.id) then
   return "*🚩| ـۧلاٰ يمۘڪُڼڱ ﺣظړ ٺـآج ړآسِڱ*"
    end
  if not is_gbanned(msg.reply.id) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ٱلغٱ۽ ﺣظړۿٖ عْآمٰ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
    else
unbanall_user(msg.reply.id)
    return "*👁‍🗨| ټـم آلغآ۽ ﺣظړۿٖ عْآمٰ*\n*👁‍🗨|آېډۑًهِ :* "..("`["..(msg.reply.id)).."]`"
  end
	elseif matches[2] and not string.match(matches[2], '^%d+$') then
   if not resolve_username(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
     end
   end
   ---------------------------clean---------------------------
   if matches[1] == 'مسح' and is_mod(msg) then
	if matches[2] == 'المحظورين' then
		if next(data[tostring(msg.to.id)]['banned']) == nil then
			return "*🚩| ـۧلاٰ ېۄجډ ﻣۘﺣظَﯛړېڼ*"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['banned']) do
			data[tostring(msg.to.id)]['banned'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "*🚩| ټـمۘ مۘسِحَ ٱﻟﻣۘﺣظَﯛړېڼ*"
	end
	if matches[2] == 'المكتومين' then
		if next(data[tostring(msg.to.id)]['is_silent_users']) == nil then
			return "*🚩| ټـمۘ مۘسِحَ ٱﻟﻣۘڪټـﯛمَېڼ*"
		end
		for k,v in pairs(data[tostring(msg.to.id)]['is_silent_users']) do
			data[tostring(msg.to.id)]['is_silent_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "*🚩| ټـمۘ مۘسِحَ ٱﻟﻣۘڪټـﯛمَېڼ*"
	end
	if matches[2] == 'العام' and is_admin(msg) then
		if next(data['gban_users']) == nil then
			return "*🚩| ټـمۘ مۘسِحَ ٱﻟﻣۘﺣظَﯛړېڼٰ*"
		end
		for k,v in pairs(data['gban_users']) do
			data['gban_users'][tostring(k)] = nil
			save_data(_config.moderation.data, data)
		end
		return "*🚩| ټـمۘ مۘسِحَ ٱﻟﻣۘﺣظَﯛړېڼٰ*"
	end
   end

end
return {
	patterns = {
"^(حظر)$",
"^(الغاء حظر)$",
"^(طرد)$",
"^(حظر عام)$",
"^(الغاء عام)$",
"^(الغاء كتم)$",
"^(كتم)$",
"^(المحظورين) (.*)$",
"^(المكتومين) (.*)$",
"^(العام) (.*)$",
"^(مسح) (.*)$",
	},
	run = Falcon,

}
