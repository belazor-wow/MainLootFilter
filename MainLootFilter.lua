local private = select(2, ...) ---@class PrivateNamespace

---@param chatFrame Frame
---@param event string
---@param ... any
---@return boolean filterMessage Whether to filter this message
---@return any ... arg2...arg11
local function MainLootFilter_OnEvent(chatFrame, event, ...)
    if chatFrame:GetName() ~= "ChatFrame1" then
        -- Always allow the message in other chat frames
        private.Debug("Loot message allowed for", chatFrame:GetName())
        return false, ...
    end

    local guid = select(12, ...) or ""
    if C_AccountInfo.IsGUIDRelatedToLocalAccount(guid) then
        return false, ...
    else
        return true, ...
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", MainLootFilter_OnEvent)
