classdef CST_TOUCHSTONE < handle
    % CST_TOUCHSTONE - See CST documentation for TOUCHSTONE under Visual
    % Basic.
    
    properties
        tstone;
    end
    
    methods
        function hObj = CST_TOUCHSTONE(mws, fname)
            hObj.tstone = invoke(mws, 'TOUCHSTONE');
            invoke(hObj.tstone, 'Reset');
            invoke(hObj.tstone, 'FileName', fname);
            invoke(hObj.tstone, 'FrequencyRange', 'Full');
            invoke(hObj.tstone, 'Impedance', 50);
            invoke(hObj.tstone, 'Renormalize', 'False');
        end
        
        function cst_object = getCSTObject(hObj)
            cst_object = hObj.tstone;
        end
        
        function Reset(hObj)
            invoke(hObj.tstone, 'Reset');
        end
        
        function FileName(hObj, fname)
            invoke(hObj.tstone, 'FileName', fname);
        end
        
        function FrequencyRange(hObj, range)
            invoke(hObj.tstone, 'FrequencyRange', range);
        end
        
        function Impedance(hObj, impedance)
            invoke(hObj.tstone, 'Impedance', impedance);
        end
        
        function Renormalize(hObj, renormalize)
            if renormalize
                invoke(hObj.tstone, 'Renormalize', 'True');
            else
                invoke(hObj.tstone, 'Renormalize', 'False');
            end
        end
            
        function Execute(hObj)
            invoke(hObj.tstone, 'Write');
        end
        
        function Write(hObj)
            invoke(hObj.tstone, 'Write');
        end
    end
end

