-------------------------core-------------------------

package.preload["core/sceneLoader"] = function()
    return require('editorRT/sceneLoader')
end

package.preload["core/http"] = function()
    return require('network/http')
end

package.preload["core/shaderManager"] = function()
    return require('coreex/shaderManager')
end

package.preload["core/socket"] = function()
    return require('network/socket')
end

package.preload["coreex/sceneLoaderex"] = function()
    return require('editorRT/sceneLoader')
end

-------------------------coreex-------------------------
package.preload["coreex/httpex"] = function()
    return require('network/http')
end


-------------------------swfTween-------------------------
package.preload["swfTween/drawingex2"] = function()
    
end

package.preload["swfTween/swfPlayer"] = function()
end

-------------------------alphaAreaY-------------------------
package.preload["libEffect/shaders/alphaAreaY"] = function()
    return require('coreex/alphaAreaY')
end
