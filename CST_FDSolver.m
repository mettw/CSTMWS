classdef CST_FDSolver < handle
    % CST_FDSolver - See CST documentation for FDSolver under VBScript.
    
    properties (GetAccess='private', SetAccess='private')
       solver;
    end
    
    methods
        function hObj = CST_FDSolver(mws)
            % Inititalise with the defaults that I want.
            hObj.solver = invoke(mws, 'FDSolver');
            invoke(hObj.solver, 'AccuracyTet', 1e-6);
            invoke(hObj.solver, 'Stimulation', 1, 1);
        end
        
        function cst_object = getCSTObject(hObj)
            cst_object = hObj.solver;
        end
        
        function Reset(hObj)
            invoke(hObj.solver, 'Reset');
        end
        
        function Start(hObj)
            invoke(hObj.solver, 'Start');
        end
        
        function AcceleratedRestart(hObj, flag)
            invoke(hObj.solver, 'AcceleratedRestart', flag);
        end
        
        function AccuracyTet(hObj, accuracy)
            invoke(hObj.solver, 'AccuracyTet', accuracy);
        end
        
        function Stimulation(hObj, port, mode)
            invoke(hObj.solver, 'Stimulation', port, mode);
        end
    end
end

