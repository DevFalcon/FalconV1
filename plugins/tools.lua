-- تـم التعديـل والتعريب بواسطه @Sudo_Sky
-- Tools.lua

local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end

local function index_function(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end

local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end

local function already_sudo(user_id)
  for k,v in pairs(_config.sudo_users) do
    if user_id == v then
      return k
    end
  end
  -- If not found
  return false
end


local function already_admin(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end


local function sudolist(msg)
local sudo_users = _config.sudo_users
local text = "*🚩| قآئمۘه ٱݪمطَـﯛڔېڹ :*\nᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼ\n"
for i=1,#sudo_users do
    text = text..i.." - "..sudo_users[i].."\n"
end
return text
end

local function adminlist(msg)
 text = '*🚩| قآئمۘه ٱݪمشِړفِيڹ :*\nᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼ\n'
		  	local compare = text
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    text = text..i..'- '..(user[2] or '')..' > `[`'..user[1]..'`]`\n'
		  	i = i +1
		  	end
		  	if compare == text then
		  		text = '*🚩| ـۧلاٰ ێۄﺟډ ﻣۘﺸِړفِێڼ*'
		  	end
		  	return text
    end

local function chat_list(msg)
	i = 1
	local data = load_data(_config.moderation.data)
    local groups = 'groups'
    if not data[tostring(groups)] then
        return '*لا تـوجد مجمـوعات👥❌*'
    end
    local message = '*🚩| عّٖـډډ ٱݪمِجمۘۄعّٖٱټ ٱݪمۘفعݪه :*\nᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼ\n'
    for k,v in pairsByKeys(data[tostring(groups)]) do
		local group_id = v
		if data[tostring(group_id)] then
			settings = data[tostring(group_id)]['settings']
		end
        for m,n in pairsByKeys(settings) do
			if m == 'set_name' then
				name = n:gsub("", "")
				chat_name = name:gsub("‮", "")
				group_name_id = name .. '\n(🆔 : ' ..group_id.. ')\n\n'
				if name:match("[\216-\219][\128-\191]") then
					group_info = i..' - \n'..group_name_id
				else
					group_info = i..' - '..group_name_id
				end
				i = i + 1
			end
        end
		message = message..group_info
    end
	return message
end

local function run(msg, matches)
    local data = load_data(_config.moderation.data)
   if matches[1] == "المطورين" and is_sudo(msg) then
    return sudolist(msg)
   end
  if tonumber(msg.from.id) == tonumber(sudo_id) then
   if matches[1] == "رفع مطور" then
   if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if already_sudo(tonumber(msg.reply.id)) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ړفعّٖـﮥ ﻣۘـِطۄړ*\n*👁‍🗨| معّٖرفـُﮥ :* `[`"..username.."`]`"
    else
          table.insert(_config.sudo_users, tonumber(msg.reply.id)) 
      print(msg.reply.id..'*ټـم ړفعّٖـﮥ ﻣۘـِطۅړ*') 
     save_config() 
     reload_plugins(true) 
    return "*👁‍🗨| ټـم ړفعّٖـﮥ ﻣۘـِطۅړ*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
   if not getUser(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
  end
end
   if matches[1] == "تنزيل مطور" then
      if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if not already_sudo(tonumber(msg.reply.id)) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ټڹزيݪـِﮥ آݪۍ عّٖضـِﯛ*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
    else
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(msg.reply.id)))
		save_config()
     reload_plugins(true) 
    return "*👁‍🗨| ټـم ټڹزيݪـِﮥ آݪۍ عّٖضـِﯛ*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
      end
   end
end
  if is_sudo(msg) then
   if matches[1] == "رفع مشرف" then
   if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if already_admin(tonumber(msg.reply.id)) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ړفعّٖـﮥ ﻣۘـِﺸړف*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
    else
	    table.insert(_config.admins, {tonumber(msg.reply.id), username})
		save_config() 
    return "*👁‍🗨| ټـم ړفعّٖـﮥ ﻣۘـِﺸړف*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
   if not getUser(matches[2]).result then
   return "*🚩| اٰݪعّٖضـﯛ غێړ ﻣۘﯛﺟﯛډ*"
    end
  end
end
   if matches[1] == "تنزيل مشرف" then
      if not matches[2] and msg.reply_to_message then
	if msg.reply.username then
	username = "@"..check_markdown(msg.reply.username)
    else
	username = escape_markdown(msg.reply.print_name)
    end
   if not already_admin(tonumber(msg.reply.id)) then
    return "*👁‍🗨| ﺑـٱلفعّٖـِݪ ټـم ټڹزيݪـِﮥ آݪۍ عّٖضـِﯛ*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
    else
	local nameid = index_function(tonumber(msg.reply.id))
		table.remove(_config.admins, nameid)
		save_config()
    return "*👁‍🗨| ټـم ټڹزيݪـِﮥ آݪۍ عّٖضـِﯛ*\n*👁‍🗨| معّٖرفـُﮥ : *`[`"..username.."`]`"
      end
	  elseif matches[2] and matches[2]:match('^%d+') then
  if not getUser(matches[2]).result then
   return "*المستـخدم غـير مـوجود👤❌*"
    end
      end
   end
end
  if is_sudo(msg) then
	if matches[1]:lower() == "sendfile" and matches[2] and matches[3] then
		local send_file = "./"..matches[2].."/"..matches[3]
		sendDocument(msg.to.id, send_file, msg.id, "[@Team_Advisor]")
	end
	if matches[1]:lower() == "جلب ملف" and matches[2] then
	    local plug = "./plugins/"..matches[2]..".lua"
		sendDocument(msg.to.id, plug, msg.id, "[@Team_Advisor]")
    end
	if matches[1]:lower() == "savefile" and matches[2]then
	local fn = matches[2]:gsub('(.*)/', '')
	local pt = matches[2]:gsub('/'..fn..'$', '')
if msg.reply_to_message then
if msg.reply_to_message.photo then
if msg.reply_to_message.photo[3] then
fileid = msg.reply_to_message.photo[3].file_id
elseif msg.reply_to_message.photo[2] then
fileid = msg.reply_to_message.photo[2].file_id
   else
fileid = msg.reply_to_message.photo[1].file_id
  end
elseif msg.reply_to_message.sticker then
fileid = msg.reply_to_message.sticker.file_id
elseif msg.reply_to_message.voice then
fileid = msg.reply_to_message.voice.file_id
elseif msg.reply_to_message.video then
fileid = msg.reply_to_message.video.file_id
elseif msg.reply_to_message.document then
fileid = msg.reply_to_message.document.file_id
end
downloadFile(fileid, "./"..pt.."/"..fn)
return "*File* `"..fn.."` _has been saved in_ *"..pt.."*"
  end
end
	if matches[1]:lower() == "save" and matches[2] then
if msg.reply_to_message then
if msg.reply_to_message.document then
fileid = msg.reply_to_message.document.file_id
filename = msg.reply_to_message.document.file_name
if tostring(filename):match(".lua") then
downloadFile(fileid, "./plugins/"..matches[2]..".lua")
return "*Plugin* `"..matches[2]..".lua` _has been saved_"
        end
     end
  end
end
if matches[1] == 'المشرفين' and is_admin(msg) then
return adminlist(msg)
    end
if matches[1] == 'المجموعات' and is_admin(msg) then
return chat_list(msg)
    end
		if matches[1] == 'عطل' and matches[1] and is_admin(msg) then
    local data = load_data(_config.moderation.data)
			-- Group configuration removal
			data[tostring(matches[1])] = nil
			save_data(_config.moderation.data, data)
			local groups = 'groups'
			if not data[tostring(groups)] then
				data[tostring(groups)] = nil
				save_data(_config.moderation.data, data)
			end
			data[tostring(groups)][tostring(matches[2])] = nil
			save_data(_config.moderation.data, data)
	   send_msg(matches[1], "*🚩| آݪمۘجمۘۅعّٖهَ \nټـمٌ ټعّٖطَيݪۿٖٱ ﻋڼ طَړيقِ آﻟآېډﻱَ*", nil, 'md')
    return '*🚩| آݪمۘجمۘۅعّٖهَ : * *'..matches[2]..'*\n*🚩| ټـمٌ ټعّٖطَيݪۿٖٱ ﻋڼ طَړيقِ آﻟآېډﻱَ*'
		end
     if matches[1] == 'اخرج' and is_admin(msg) then
  leave_group(msg.to.id)
   end
     if matches[1] == 'نشر' and is_admin(msg) and matches[2] and matches[3] then
		local text = matches[2]
send_msg(matches[3], text)	end
 end
   if matches[1] == 'اذاعه' and is_sudo(msg) then		
  local data = load_data(_config.moderation.data)		
  local bc = matches[2]			
  for k,v in pairs(data) do				
send_msg(k, bc)			
  end	
end
     if matches[1] == 'autoleave' and is_admin(msg) then
local hash = 'AutoLeaveBot'
--Enable Auto Leave
     if matches[2] == 'enable' then
    redis:del(hash)
   return 'Auto leave has been enabled'
--Disable Auto Leave
     elseif matches[2] == 'disable' then
    redis:set(hash, true)
   return 'Auto leave has been disabled'
--Auto Leave Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Auto leave is enable'
       else
   return 'Auto leave is disable'
         end
      end
end
---------------Help Tools----------------
  if matches[1] == "اوامر المطور" and is_admin(msg) then
    local text = [[*♕ ៲❘៲ ٱﯛٱمـُړ آ ݪمطَـﯛړ ៲❘៲ ♕
ᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ
🔅| فعل ⌁ عطل 
🔅| عطل + ايدي مجموعه لتعطيل 
ᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ
🔅| الاعدادات ⌁ اعدادات الوسائط
🔅| رفع مطور ⌁ تنزيل مطور
🔅| رفع مشرف ⌁ تنزيل مشرف
🔅| رفع مدير ⌁ تنزيل مدير
🔅| رفع ادمن ⌁ تنزيل ادمن
ᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ
🔅| المطورين ⌁ المدراء ⌁ الادمنيه
🔅| منع ⌁ الغاء منع ⌁ قائمه المنع
🔅| ضع قوانين ⌁ القوانين
🔅| ضع رابط  ⌁ ضع ترحيب ⌁  الرابط
🔅| ضع صوره ⌁ حذف صوره
🔅| اذاعه ⌁ نشر + ايدي المجموعه
🔅| ضع اسم ⌁ ضع وصف
🔅| ثبت ⌁ الغاء تثبيت ⌁ الاصدار
ᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ  
🔅| ارسل ⌁ الاوامر لعرضها
ᱻᱻᱻᱻᱻᱻᱻᱻᱼᱼᱹᱹᱹ🔅ᱹᱹᱹᱼᱼᱻᱻᱻᱻᱻᱻᱻᱻ
CH -* [@Team_Advisor]
]]
    return text
  end
end
return {
  patterns = {
    "^(اوامر المطور)$",
    "^(رفع مطور)$",
    "^(تنزيل مطور)$",
    "^(رفع مطور) (.*)$",
    "^(تنزيل مطور) (.*)$",
    "^(المطورين)$",
    "^(رفع مشرف)$",
    "^(تنزيل مشرف)$",
    "^(رفع مشرف) (.*)$",
    "^(تنزيل مشرف) (.*)$",
    "^(المشرفين)$",
    "^(المجموعات)$",
    "^[!/](sendfile) (.*) (.*)$",
    "^[!/](savefile) (.*)$",
    "^(نشر) (.*) (-%d+)$",
    "^(اذاعه) (.*)$",
    --"^(جلب ملف) (.*)$",
    "^[!/](save) (.*)$",
    "^(اخرج)$",
    "^(عطل) (-%d+)$",
    },
  run = run,
  pre_process = pre_process
}

-- تـم التعديـل والتعريب بواسطه @Sudo_Sky
-- Tools.lua
