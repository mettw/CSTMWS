classdef CST_ASCIIExport < handle
    % CST_ASCIIExport - See CST documentation for ASCIIExport under Visual
    % Basic.
    
    properties
        asciiExp;
    end
    
    methods
        function hObj = CST_ASCIIExport(mws)
            hObj.asciiExp = invoke(mws, 'ASCIIExport');
        end
        
        function Setup(hObj, fname, xmin, xmax, ymin, ymax, zmin, zmax)
            invoke(hObj.asciiExp, 'Reset');
            invoke(hObj.asciiExp, 'FileName', fname);
            invoke(hObj.asciiExp, 'SetfileType', 'ascii');
            invoke(hObj.asciiExp, 'SetSubvolume', num2str(xmin), num2str(xmax),...
                 num2str(ymin), num2str(ymax), num2str(zmin), num2str(zmax));
            invoke(hObj.asciiExp, 'UseSubvolume', 'True');
            invoke(hObj.asciiExp, 'Mode', 'FixedWidth');
            invoke(hObj.asciiExp, 'Step', '1');
        end
        
        function cst_object = getCSTObject(hObj)
            cst_object = hObj.asciiExp;
        end
        
        function Reset(hObj)
            invoke(hObj.asciiExp, 'Reset');
        end
        
        function FileName(hObj, fname)
            invoke(hObj.asciiExp, 'FileName', fname);
        end
        
        function Mode(hObj, mode)
            invoke(hObj.asciiExp, 'Mode', mode);
        end
        
        function SetfileType(hObj, type)
            invoke(hObj.asciiExp, 'SetfileType', type);
        end
        
        function SetFileType(hObj, type)
            invoke(hObj.asciiExp, 'SetfileType', type);
        end
        
        function SetCsvSeparator(hObj, val)
            invoke(hObj.asciiExp, 'SetCsvSeparator', val);
        end
        
        function ExportCoordinatesInMeter(hObj, val)
            invoke(hObj.asciiExp, 'ExportCoordinatesInMeter', val);
        end
        
        function Step(hObj, step)
            invoke(hObj.asciiExp, 'Step', step);
        end
        
        function StepX(hObj, step)
            invoke(hObj.asciiExp, 'StepX', step);
        end
        
        function StepY(hObj, step)
            invoke(hObj.asciiExp, 'StepY', step);
        end
        
        function StepZ(hObj, step)
            invoke(hObj.asciiExp, 'StepZ', step);
        end
                
        function SetPointFile(hObj, fname)
            invoke(hObj.asciiExp, 'SetPointFile', fname);
        end
        
        function SetSubvolume(hObj, xmin, xmax, ymin, ymax, zmin, zmax)
            invoke(hObj.asciiExp, 'SetSubvolume', num2str(xmin), num2str(xmax),...
                 num2str(ymin), num2str(ymax),...
                 num2str(zmin), num2str(zmax));
        end
        
        function UseSubvolume(hObj, use_subvolume)
            if use_subvolume
                invoke(hObj.asciiExp, 'UseSubvolume', 'True');
            else
                invoke(hObj.asciiExp, 'UseSubvolume', 'False');
            end
        end
        
        function SetTimeRange(hObj, val_min, val_max)
            invoke(hObj.asciiExp, 'SetTimeRange', val_min, val_max);
        end
        
        function SetSampleRange(hObj, val_min, val_max)
            invoke(hObj.asciiExp, 'SetSampleRange', val_min, val_max);
        end
        
        function Execute(hObj)
            invoke(hObj.asciiExp, 'Execute');
        end
        
        function Write(hObj)
            invoke(hObj.asciiExp, 'Execute');
        end
    end
end

