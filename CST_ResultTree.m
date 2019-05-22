classdef CST_ResultTree < handle
    % CST_ResultTree - See CST documentation for ResultTree under Visual
    % Basic.
    
    properties
        rtree;
    end
    
    methods
        function hObj = CST_ResultTree(mws)
            hObj.rtree = invoke(mws, 'ResultTree');
        end
        
        function cst_object = getCSTObject(hObj)
            cst_object = hObj.rtree;
        end
        
        function Reset(hObj)
            invoke(hObj.rtree, 'Reset');
        end
        
        function child_name = GetFirstChildName(hObj, dir)
            child_name = invoke(hObj.rtree, 'GetFirstChildName', dir);
        end
        
        function next_child_name = GetNextItemName(hObj, child_name)
            next_child_name = invoke(hObj.rtree, 'GetNextItemName',...
                child_name);
        end
        
    end
end

