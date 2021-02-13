-------------------------------------------------------------------------------------------------------------
--
-- AzerothCoreAdmin is a derivative of TrinityAdmin and MangAdmin.
--
-- Copyright (C) 2018 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official repository: https://github.com/LightDestory/AzerothCoreAdmin
--
-------------------------------------------------------------------------------------------------------------

function commandTargetCheck()
    return (MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none"))
end

function getCommandTargetName()
    return (UnitName("target") or UnitName("player"))
end

function genericLogGenerator(textID, values)
    local log = Locale[textID]
    local params = {}
    for w in values:gmatch("%w+") do
        table.insert(params, w)
      end
    for i=#params, 1, -1 do
        local pattern = "_V" .. i .. "_"
        log = string.gsub(log, pattern, params[i])
    end
    return log
end

function getCallsDictionary(ID)
    if ID == GM_KEY then return GM_genericCommands
    else return nil
    end
end